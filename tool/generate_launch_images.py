"""Generate the iOS launch-screen wordmark from the Elan vector logo.

    python tool/generate_launch_images.py            # write LaunchImage@1x/2x/3x
    python tool/generate_launch_images.py --preview  # composite on black, no writes

Run from the repository root. Requires only Pillow.

## Why

`ios/Runner/Base.lproj/LaunchScreen.storyboard` puts a `LaunchImage` on a black
view at `contentMode="center"`, i.e. at its natural 180x55 pt size. The shipped
PNGs were upscaled from `assets/eclan_logo.png` (118x36), so the 3x asset was
carrying 540 px of detail invented from a 118 px original — soft on every device
Apple has sold since the 6 Plus. `tool/elan-logo.svg` is 749x226 of real vector,
so all three scales come out sharp.

## Framing

The existing PNGs are tight-cropped: their alpha bounding box is the full canvas
on all three. So this fits the artwork's **content** box, not the SVG viewBox —
the viewBox carries ~10 units of slack on the left, and honouring it would shrink
the mark and shift it right relative to what currently ships.

Content box is 739x225 (3.283:1) against a 180x55 canvas (3.273:1). Close enough
that fitting by width leaves sub-pixel vertical slack, and far better than
stretching to fill and distorting the letterforms.

## Colour

Black becomes white; the green is left alone. That is the repo's own
dark-background rule — `assets/eclan_logo.png` and `assets/eclan_color_logo.png`
are the same artwork differing by exactly that swap — and the storyboard's view
behind this image is black.
"""

import argparse
import os
import sys

from PIL import Image

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import svg_raster  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SVG = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'elan-logo.svg')
DEST = os.path.join(ROOT, 'ios', 'Runner', 'Assets.xcassets', 'LaunchImage.imageset')

WHITE = (255, 255, 255)
BLACK = (0, 0, 0)

# Points, from the storyboard's `<image name="LaunchImage" width="180" height="55"/>`.
BASE = (180, 55)
SCALES = {'LaunchImage.png': 1, 'LaunchImage@2x.png': 2, 'LaunchImage@3x.png': 3}


def _wordmark():
    """Every path, black recoloured to white, plus the combined content box."""
    polys = [(svg_raster.path_to_polygons(d), WHITE if rgb == BLACK else rgb)
             for d, rgb in svg_raster.load(SVG)]
    xs = [x for p, _ in polys for sp in p for x, y in sp]
    ys = [y for p, _ in polys for sp in p for x, y in sp]
    box = (min(xs), min(ys), max(xs), max(ys))
    assert 730 < box[2] - box[0] < 750 and 220 < box[3] - box[1] < 230, \
        f'unexpected wordmark bounds {box} — did elan-logo.svg change?'
    return polys, box


POLYS, BOX = _wordmark()


def render(scale):
    width, height = BASE[0] * scale, BASE[1] * scale
    x0, y0, x1, y1 = BOX
    w, h = x1 - x0, y1 - y0
    s = min(width / w, height / h)
    return svg_raster.rasterise(
        POLYS, width, height, s,
        tx=(width - w * s) / 2 - x0 * s,
        ty=(height - h * s) / 2 - y0 * s,
    )


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--preview', action='store_true',
                    help='write launch_preview.png on black and exit')
    args = ap.parse_args()

    if args.preview:
        tiles = [render(s) for s in (1, 2, 3)]
        pad = 24
        width = max(t.width for t in tiles) + pad * 2
        height = sum(t.height for t in tiles) + pad * (len(tiles) + 1)
        sheet = Image.new('RGBA', (width, height), BLACK + (255,))
        y = pad
        for t in tiles:
            sheet.alpha_composite(t, ((width - t.width) // 2, y))
            y += t.height + pad
        out = os.path.join(ROOT, 'launch_preview.png')
        sheet.convert('RGB').save(out)
        print('preview ->', out)
    else:
        for filename, scale in SCALES.items():
            path = os.path.join(DEST, filename)
            render(scale).save(path)
            print('wrote', os.path.relpath(path, ROOT))
