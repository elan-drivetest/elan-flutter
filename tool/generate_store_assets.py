"""Generate the Google Play store graphics from the Elan vector logo.

    python tool/generate_store_assets.py

Run from the repository root. Requires only Pillow. Writes to store/play/:

* icon-512.png:            512x512 hi-res icon (same art as the launcher icon)
* feature-graphic-1024x500.png: 1024x500 feature graphic

Reuses generate_app_icons' glyph renderer so the store icon can never drift
from the on-device launcher icon.
"""
import os
import sys

from PIL import Image, ImageDraw, ImageFont

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import generate_app_icons as icons  # noqa: E402

OUT = os.path.join(icons.ROOT, 'store', 'play')


def _font(size, bold=True):
    names = (['segoeuib.ttf', 'arialbd.ttf'] if bold
             else ['segoeui.ttf', 'arial.ttf'])
    for name in names:
        try:
            return ImageFont.truetype(name, size)
        except OSError:
            continue
    return ImageFont.load_default()


def icon_512():
    # Play wants a square 32-bit PNG; it applies its own rounding mask.
    return icons.full_bleed(512, round_mask=False).convert('RGBA')


def feature_graphic():
    w, h = 1024, 500
    img = Image.new('RGB', (w, h), icons.BACKGROUND)
    glyph = icons.render_glyph(300, 0.9, icons.GREEN, icons.WHITE)
    img.paste(glyph, (70, (h - 300) // 2), glyph)

    d = ImageDraw.Draw(img)
    x = 420
    d.text((x, 150), 'Elan Instructor', font=_font(64), fill=icons.WHITE)
    d.text((x, 240), 'Road-test rides. Live tracking.',
           font=_font(34, bold=False), fill=(220, 220, 220))
    d.text((x, 290), 'Payouts via Stripe.', font=_font(34, bold=False),
           fill=(220, 220, 220))
    d.rectangle([x, 360, x + 120, 366], fill=icons.GREEN)
    return img


def main():
    os.makedirs(OUT, exist_ok=True)
    icon_512().save(os.path.join(OUT, 'icon-512.png'))
    feature_graphic().save(os.path.join(OUT, 'feature-graphic-1024x500.png'))
    print('wrote', OUT)


if __name__ == '__main__':
    main()
