"""Generate the Android and iOS launcher icons from the Elan vector logo.

    python tool/generate_app_icons.py            # write icons
    python tool/generate_app_icons.py --preview  # contact sheet only, no writes

Run from the repository root. Requires only Pillow.

## Why a script instead of `flutter_launcher_icons`

The usual package takes a pre-rendered 1024 px PNG and resizes it. We do not
have one — the only brand art in the repo is `assets/eclan_logo.png` at 118x36,
which is far too small to upscale into a 1024 px icon. The real source is
`tool/elan-logo.svg` (749x226, lifted from the marketing site), so something has
to rasterise vectors either way. Doing it here keeps the whole pipeline in one
place, adds no dependency to `pubspec.yaml`, and lets us emit the pieces
`flutter_launcher_icons` does not: the Android 13 monochrome layer and the
API 31+ splash drawable.

## The mark

The icon is the brand's `é` — the letter that carries "élan" — not the full
wordmark, which is 3.3:1 and unreadable at 48 dp.

Colours follow the repo's own dark-background rule. `assets/eclan_logo.png` and
`assets/eclan_color_logo.png` are the same artwork with black swapped for white
and the green left alone, so on the black icon background the bowl stays
#4CAF50 and the acute accent goes white. Background is the same #000000 as
`brand_splash_background`, so the launcher icon, the OS splash and the Flutter
splash are one continuous surface.

## Sizing

Two different fractions, because the two icon formats are measured differently.

* Full-bleed (iOS, Android legacy): the whole PNG is the icon, so the glyph is
  sized against the full canvas.
* Adaptive (Android 8+): the canvas is 108 dp but launchers only ever show the
  inner 72 dp — the outer ring is bleed for masking and parallax. To land at the
  same apparent size as the full-bleed icon the glyph must be scaled against
  that 72 dp window, not the 108 dp canvas: 0.64 * 72/108 = 0.427.

Getting this wrong is the classic adaptive-icon bug where the mark looks
correct in the mipmap folder and comically oversized on the home screen.
"""

import argparse
import json
import os
import sys

from PIL import Image, ImageDraw

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import svg_raster  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SVG = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'elan-logo.svg')

BACKGROUND = (0, 0, 0)
GREEN = (76, 175, 80)
WHITE = (255, 255, 255)

# Indices into the SVG's path list. The file is vendored beside this script so
# they are stable; _load_glyph asserts the geometry to fail loudly rather than
# silently render the wrong shape if the logo is ever re-exported.
BOWL, ACCENT = 0, 2

GLYPH_FRACTION = 0.64
ADAPTIVE_FRACTION = GLYPH_FRACTION * 72 / 108

# Android legacy launcher icon, per density bucket.
LEGACY = {'mdpi': 48, 'hdpi': 72, 'xhdpi': 96, 'xxhdpi': 144, 'xxxhdpi': 192}
# Adaptive layers are 108 dp on the same buckets.
ADAPTIVE = {k: round(v * 108 / 48) for k, v in LEGACY.items()}


def _load_glyph():
    paths = svg_raster.load(SVG)
    polys = [(svg_raster.path_to_polygons(d), rgb) for d, rgb in paths]

    def bbox(sel):
        xs = [x for p, _ in sel for sp in p for x, y in sp]
        ys = [y for p, _ in sel for sp in p for x, y in sp]
        return min(xs), min(ys), max(xs), max(ys)

    bowl, accent = polys[BOWL], polys[ACCENT]
    assert bowl[1] == GREEN, f'path {BOWL} should be the green bowl, got {bowl[1]}'
    assert accent[1] == (0, 0, 0), f'path {ACCENT} should be the accent'
    x0, y0, x1, y1 = bbox([bowl, accent])
    assert 120 < x1 - x0 < 130 and 200 < y1 - y0 < 210, \
        f'unexpected glyph bounds {(x0, y0, x1, y1)} — did elan-logo.svg change?'
    return bowl[0], accent[0], (x0, y0, x1, y1)


BOWL_POLY, ACCENT_POLY, GLYPH_BOX = _load_glyph()


def render_glyph(size, fraction, bowl_rgb, accent_rgb):
    """The é on a transparent canvas, fitted to `fraction` of `size` by height."""
    x0, y0, x1, y1 = GLYPH_BOX
    w, h = x1 - x0, y1 - y0
    scale = size * fraction / h
    if w * scale > size * fraction:          # never happens for this glyph, but
        scale = size * fraction / w          # keep it honest if the art changes
    # rasterise maps a point as `p * scale + t`, so the offsets are in output
    # pixels, not SVG units.
    return svg_raster.rasterise(
        [(BOWL_POLY, bowl_rgb), (ACCENT_POLY, accent_rgb)],
        size, size, scale,
        tx=(size - w * scale) / 2 - x0 * scale,
        ty=(size - h * scale) / 2 - y0 * scale,
    )


def full_bleed(size, round_mask=False):
    """Square icon with the background baked in. iOS and Android legacy."""
    if round_mask:
        # 4x supersample so the circle edge is not stair-stepped.
        ss = 4
        base = Image.new('RGBA', (size * ss, size * ss), (0, 0, 0, 0))
        ImageDraw.Draw(base).ellipse(
            (0, 0, size * ss - 1, size * ss - 1), fill=BACKGROUND + (255,))
        base = base.resize((size, size), Image.LANCZOS)
    else:
        base = Image.new('RGBA', (size, size), BACKGROUND + (255,))
    return Image.alpha_composite(
        base, render_glyph(size, GLYPH_FRACTION, GREEN, WHITE))


def adaptive_foreground(size):
    return render_glyph(size, ADAPTIVE_FRACTION, GREEN, WHITE)


def adaptive_monochrome(size):
    """Android 13 themed icons: an alpha silhouette the system tints itself."""
    return render_glyph(size, ADAPTIVE_FRACTION, (0, 0, 0), (0, 0, 0))


def write_png(img, path, drop_alpha=False):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    if drop_alpha:
        # App Store rejects icons with an alpha channel; flatten onto the
        # background rather than leaving transparency for iOS to guess at.
        flat = Image.new('RGB', img.size, BACKGROUND)
        flat.paste(img, mask=img.split()[3])
        flat.save(path)
    else:
        img.save(path)
    return path


def generate_android():
    written = []
    res = os.path.join(ROOT, 'android', 'app', 'src', 'main', 'res')
    for bucket, size in LEGACY.items():
        d = os.path.join(res, f'mipmap-{bucket}')
        written.append(write_png(full_bleed(size), os.path.join(d, 'ic_launcher.png')))
        written.append(write_png(full_bleed(size, round_mask=True),
                                 os.path.join(d, 'ic_launcher_round.png')))
    for bucket, size in ADAPTIVE.items():
        d = os.path.join(res, f'mipmap-{bucket}')
        written.append(write_png(adaptive_foreground(size),
                                 os.path.join(d, 'ic_launcher_foreground.png')))
        written.append(write_png(adaptive_monochrome(size),
                                 os.path.join(d, 'ic_launcher_monochrome.png')))
    return written


def generate_ios():
    d = os.path.join(ROOT, 'ios', 'Runner', 'Assets.xcassets', 'AppIcon.appiconset')
    with open(os.path.join(d, 'Contents.json'), encoding='utf-8') as f:
        contents = json.load(f)

    # Contents.json lists the same file under several idioms; render each once.
    wanted = {}
    for entry in contents['images']:
        if 'filename' not in entry:
            continue
        px = round(float(entry['size'].split('x')[0]) * int(entry['scale'].rstrip('x')))
        wanted[entry['filename']] = px

    written = []
    for filename, px in sorted(wanted.items(), key=lambda kv: kv[1]):
        written.append(write_png(full_bleed(px), os.path.join(d, filename),
                                 drop_alpha=True))
    return written


def preview():
    """Contact sheet at true pixel sizes, so small-size legibility is visible."""
    sizes = [48, 72, 96, 144, 192]
    pad, gap = 24, 24
    width = pad * 2 + sum(sizes) + gap * (len(sizes) - 1)
    sheet = Image.new('RGB', (width, 192 + pad * 2), (140, 140, 140))
    x = pad
    for s in sizes:
        sheet.paste(full_bleed(s).convert('RGB'), (x, pad + 192 - s))
        x += s + gap
    out = os.path.join(ROOT, 'icon_preview.png')
    sheet.save(out)
    return out


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--preview', action='store_true',
                    help='write icon_preview.png and exit without touching icons')
    args = ap.parse_args()

    if args.preview:
        print('preview ->', preview())
    else:
        files = generate_android() + generate_ios()
        for f in files:
            print('wrote', os.path.relpath(f, ROOT))
        print(f'\n{len(files)} files')
