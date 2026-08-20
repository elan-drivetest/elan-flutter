"""Minimal SVG rasteriser for the Elan brand logo.

The source (`elan-logo.svg`, 749x226) uses only M/L/H/V/C/Z, all absolute — no
arcs, no quadratics, no transforms, no strokes. That is a small enough subset to
render exactly rather than pull in a native cairo/resvg dependency.

Fill rule is nonzero (the SVG default). The counters in 'e' and 'a' are wound
opposite to their outers, so even-odd would happen to work too — but nonzero is
what the file declares, so that is what this implements.

Anti-aliasing is 4x4 supersampling: coverage is accumulated per subsample row
and averaged, which is plenty at icon sizes and avoids an analytic-coverage
implementation.
"""

import re
from PIL import Image

_TOKEN = re.compile(r'[MmLlHhVvCcZz]|-?\d*\.?\d+(?:[eE]-?\d+)?')


def _flatten_cubic(p0, p1, p2, p3, out, tol=0.05):
    """Adaptive-ish cubic flattening: subdivide by control-polygon deviation."""
    # Cheap flatness proxy — distance of control points from the chord.
    x0, y0 = p0
    x3, y3 = p3
    dx, dy = x3 - x0, y3 - y0
    d1 = abs((p1[0] - x3) * dy - (p1[1] - y3) * dx)
    d2 = abs((p2[0] - x3) * dy - (p2[1] - y3) * dx)
    if (d1 + d2) ** 2 <= tol * (dx * dx + dy * dy):
        out.append(p3)
        return
    # de Casteljau split at t=0.5
    p01 = ((p0[0] + p1[0]) / 2, (p0[1] + p1[1]) / 2)
    p12 = ((p1[0] + p2[0]) / 2, (p1[1] + p2[1]) / 2)
    p23 = ((p2[0] + p3[0]) / 2, (p2[1] + p3[1]) / 2)
    p012 = ((p01[0] + p12[0]) / 2, (p01[1] + p12[1]) / 2)
    p123 = ((p12[0] + p23[0]) / 2, (p12[1] + p23[1]) / 2)
    mid = ((p012[0] + p123[0]) / 2, (p012[1] + p123[1]) / 2)
    _flatten_cubic(p0, p01, p012, mid, out, tol)
    _flatten_cubic(mid, p123, p23, p3, out, tol)


def path_to_polygons(d):
    """Return a list of closed subpaths, each a list of (x, y)."""
    toks = _TOKEN.findall(d)
    i = 0
    polys, cur = [], []
    pos = (0.0, 0.0)
    start = (0.0, 0.0)
    cmd = None

    def num():
        nonlocal i
        v = float(toks[i])
        i += 1
        return v

    while i < len(toks):
        t = toks[i]
        if t.isalpha():
            cmd = t
            i += 1
            if cmd in 'Zz':
                if cur:
                    polys.append(cur)
                    cur = []
                pos = start
                continue
        if cmd in 'Mm':
            x, y = num(), num()
            if cur:
                polys.append(cur)
            pos = start = (x, y)
            cur = [pos]
            cmd = 'L' if cmd == 'M' else 'l'
        elif cmd in 'Ll':
            x, y = num(), num()
            pos = (x, y)
            cur.append(pos)
        elif cmd in 'Hh':
            pos = (num(), pos[1])
            cur.append(pos)
        elif cmd in 'Vv':
            pos = (pos[0], num())
            cur.append(pos)
        elif cmd in 'Cc':
            p1 = (num(), num())
            p2 = (num(), num())
            p3 = (num(), num())
            _flatten_cubic(pos, p1, p2, p3, cur)
            pos = p3
        else:
            raise ValueError(f'unsupported command {cmd!r}')
    if cur:
        polys.append(cur)
    return polys


def rasterise(paths, width, height, scale, tx=0.0, ty=0.0, ss=4):
    """Render [(polygons, (r,g,b))] into an RGBA image.

    Coordinates are transformed as `p * scale + t`. Painted in list order, so
    later paths sit on top — the same as SVG document order.
    """
    W, H = width * ss, height * ss
    canvas = Image.new('RGBA', (width, height), (0, 0, 0, 0))

    for polys, rgb in paths:
        # Per-path coverage accumulation, so overlapping subpaths in one path
        # honour nonzero winding as a unit.
        cov = bytearray(W * H)
        edges = []
        for poly in polys:
            pts = [(x * scale * ss + tx * ss, y * scale * ss + ty * ss)
                   for x, y in poly]
            for a, b in zip(pts, pts[1:] + pts[:1]):
                if a[1] != b[1]:
                    edges.append((a, b))
        if not edges:
            continue

        ymin = max(0, int(min(min(a[1], b[1]) for a, b in edges)))
        ymax = min(H - 1, int(max(max(a[1], b[1]) for a, b in edges)) + 1)

        for py in range(ymin, ymax + 1):
            yc = py + 0.5
            xs = []
            for (x0, y0), (x1, y1) in edges:
                if (y0 <= yc < y1) or (y1 <= yc < y0):
                    t = (yc - y0) / (y1 - y0)
                    xs.append((x0 + t * (x1 - x0), 1 if y1 > y0 else -1))
            if not xs:
                continue
            xs.sort()
            wind = 0
            row = py * W
            for k in range(len(xs) - 1):
                wind += xs[k][1]
                if wind != 0:
                    a = max(0, int(round(xs[k][0])))
                    b = min(W, int(round(xs[k + 1][0])))
                    for px in range(a, b):
                        cov[row + px] = 255

        # Downsample coverage to an alpha mask and composite.
        mask = Image.frombytes('L', (W, H), bytes(cov)).resize(
            (width, height), Image.BOX)
        layer = Image.new('RGBA', (width, height), rgb + (255,))
        layer.putalpha(mask)
        canvas = Image.alpha_composite(canvas, layer)

    return canvas


def load(svg_path):
    """Return [(d, (r,g,b))] in document order."""
    s = open(svg_path, encoding='utf-8').read()
    out = []
    for m in re.finditer(r'<path\b([^>]*)>', s):
        attrs = m.group(1)
        d = re.search(r'\sd="([^"]*)"', attrs)
        f = re.search(r'fill="([^"]*)"', attrs)
        if not d:
            continue
        col = (f.group(1) if f else 'black').strip()
        if col in ('black', '#000', '#000000'):
            rgb = (0, 0, 0)
        elif col.startswith('#') and len(col) == 7:
            rgb = tuple(int(col[i:i + 2], 16) for i in (1, 3, 5))
        else:
            rgb = (0, 0, 0)
        out.append((d.group(1), rgb))
    return out
