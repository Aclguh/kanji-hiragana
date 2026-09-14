#!/usr/bin/env python3
"""生成应用图标: 白底 + 黑色繁体「漢」字。

产出 (Android):
  mipmap-{mdpi,hdpi,xhdpi,xxhdpi,xxxhdpi}/ic_launcher.png   传统方形图标
  mipmap-*/ic_launcher_round.png                             圆形图标
  mipmap-*/ic_launcher_foreground.png                        自适应图标前景
  values/ic_launcher_background.xml                          自适应图标背景色

设计: 纯白底 (#FFFFFF) + 居中黑色繁体「漢」字, 方正无衬线感。
自适应图标前景需留出安全边距(内容占 ~66%), 避免被裁切。

用法: python tool/gen_icon.py
"""
import os
from PIL import Image, ImageDraw, ImageFont

# 输出根目录
RES = 'android/app/src/main/res'

# 各密度下传统图标的边长(px)
DENSITIES = {
    'mdpi': 48,
    'hdpi': 72,
    'xhdpi': 96,
    'xxhdpi': 144,
    'xxxhdpi': 192,
}

# 自适应图标: 前景/背景按 108dp 基准
ADAPTIVE_SIZES = {
    'mdpi': 108,
    'hdpi': 162,
    'xhdpi': 216,
    'xxhdpi': 324,
    'xxxhdpi': 432,
}

KANJI = '漢'
WHITE = (255, 255, 255, 255)
BLACK = (17, 17, 17, 255)  # 近黑, 比纯黑柔和一点

# 优先使用黑体类字体, 笔画饱满、辨识度高
FONT_CANDIDATES = [
    'C:/Windows/Fonts/msyhbd.ttc',   # 微软雅黑 Bold
    'C:/Windows/Fonts/msyh.ttc',     # 微软雅黑
    'C:/Windows/Fonts/simhei.ttf',   # 黑体
    'C:/Windows/Fonts/YuGothB.ttc',  # 游黑体 Bold
    'C:/Windows/Fonts/msgothic.ttc', # MS Gothic
    'C:/Windows/Fonts/simsun.ttc',   # 宋体(兜底)
]


def pick_font_path() -> str:
    for p in FONT_CANDIDATES:
        if os.path.exists(p):
            return p
    raise SystemExit('未找到可用中文字体')


def load_font(path: str, size: int) -> ImageFont.FreeTypeFont:
    """加载字体。ttc 集合需要指定 index, 逐个尝试可用的。"""
    for idx in (0, 1, 2):
        try:
            return ImageFont.truetype(path, size, index=idx)
        except Exception:
            continue
    return ImageFont.truetype(path, size)


def render_glyph(font, char: str) -> Image.Image:
    """把字符渲染到一张紧贴墨迹的透明画布上。

    画布按 **字体实际渲染尺寸** 分配(而非外部给定尺寸), 否则大字号会
    被裁切, 导致测量失真。返回的图尺寸即字形真实墨迹大小。
    """
    # 用字体的实际度量决定画布大小, 留 2 倍余量确保不裁切。
    try:
        adv = font.getlength(char)
    except Exception:
        adv = font.size * 2
    try:
        asc, desc = font.getmetrics()
    except Exception:
        asc, desc = font.size, font.size
    w = int(adv) + font.size * 2
    h = asc + desc + font.size * 2
    big = Image.new('L', (max(w, 8), max(h, 8)), 0)
    d = ImageDraw.Draw(big)
    d.text((font.size, font.size), char, font=font, fill=255, anchor='lt')
    bbox = big.getbbox()
    if bbox is None:
        return Image.new('L', (1, 1), 0)
    return big.crop(bbox)


def glyph_size(font, char: str) -> tuple:
    """返回字形墨迹的 (宽, 高)。"""
    return render_glyph(font, char).size


def fit_font(path: str, target_box: int, char: str) -> ImageFont.FreeTypeFont:
    """二分查找最大的字号, 使字形墨迹刚好落在 target_box 内。"""
    lo, hi = 8, max(16, target_box * 2)
    best = load_font(path, lo)
    while lo <= hi:
        mid = (lo + hi) // 2
        font = load_font(path, mid)
        w, h = glyph_size(font, char)
        if max(w, h) <= target_box:
            best = font
            lo = mid + 1
        else:
            hi = mid - 1
    return best


def draw_kanji(canvas: Image.Image, font, char: str) -> None:
    """把字符按墨迹几何中心居中绘制到画布上。"""
    glyph = render_glyph(font, char)
    gw, gh = glyph.size
    W, H = canvas.size
    x = (W - gw) // 2
    y = (H - gh) // 2
    black_layer = Image.new('RGBA', glyph.size, BLACK)
    canvas.paste(black_layer, (x, y), glyph)


def make_square(size: int, font_path: str, char_ratio: float) -> Image.Image:
    img = Image.new('RGBA', (size, size), WHITE)
    font = fit_font(font_path, int(size * char_ratio), KANJI)
    draw_kanji(img, font, KANJI)
    return img


def make_round(size: int, font_path: str, char_ratio: float) -> Image.Image:
    """圆形图标: 白圆底 + 黑字, 圆外透明。"""
    # 先画白圆
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    draw.ellipse((0, 0, size - 1, size - 1), fill=WHITE)
    # 再叠字
    font = fit_font(font_path, int(size * char_ratio), KANJI)
    draw_kanji(img, font, KANJI)
    return img


def make_foreground(size: int, font_path: str) -> Image.Image:
    """自适应图标前景: 透明底 + 黑字。

    自适应图标会被系统裁成各种形状, 安全区约为中心的 66%,
    因此字形控制在 ~40% 边长以内, 保证任何裁切下都完整。
    """
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    font = fit_font(font_path, int(size * 0.40), KANJI)
    draw_kanji(img, font, KANJI)
    return img


def ensure_dir(path: str) -> None:
    os.makedirs(path, exist_ok=True)


def verify_centering(path: str, label: str) -> None:
    """校验生成图标的字形是否正确居中, 并打印偏差。"""
    im = Image.open(path).convert('RGBA')
    W, H = im.size
    # 找非透明、非白的像素(即黑字)
    px = im.load()
    minx, miny, maxx, maxy = W, H, -1, -1
    for y in range(H):
        for x in range(W):
            r, g, b, a = px[x, y]
            if a > 32 and not (r > 200 and g > 200 and b > 200):
                if x < minx:
                    minx = x
                if y < miny:
                    miny = y
                if x > maxx:
                    maxx = x
                if y > maxy:
                    maxy = y
    if maxx < 0:
        print(f'  {label}: 未检测到字形!')
        return
    cx = (minx + maxx) / 2
    cy = (miny + maxy) / 2
    dx = cx - W / 2
    dy = cy - H / 2
    size_ratio = max(maxx - minx, maxy - miny) / W
    flag = '' if abs(dx) <= 1.5 and abs(dy) <= 1.5 else '  <== 偏移偏大'
    print(f'  {label}: {W}px  偏移 dx={dx:+.1f} dy={dy:+.1f}  '
          f'字形占比={size_ratio:.0%}{flag}')


def main() -> None:
    font_path = pick_font_path()
    print(f'字体: {font_path}')

    for density, size in DENSITIES.items():
        out_dir = os.path.join(RES, f'mipmap-{density}')
        ensure_dir(out_dir)

        # 传统方形图标: 字形约占 68%
        square = make_square(size, font_path, 0.68)
        square.save(os.path.join(out_dir, 'ic_launcher.png'))

        # 圆形图标: 圆形可视区更小, 比例略降
        round_icon = make_round(size, font_path, 0.62)
        round_icon.save(os.path.join(out_dir, 'ic_launcher_round.png'))

        print(f'  {density}: {size}px 方形 + 圆形')

    # 自适应图标
    for density, size in ADAPTIVE_SIZES.items():
        out_dir = os.path.join(RES, f'mipmap-{density}')
        ensure_dir(out_dir)
        fg = make_foreground(size, font_path)
        fg.save(os.path.join(out_dir, 'ic_launcher_foreground.png'))
        print(f'  {density}: {size}px 自适应前景')

    # 自适应图标背景色
    values_dir = os.path.join(RES, 'values')
    ensure_dir(values_dir)
    with open(os.path.join(values_dir, 'ic_launcher_background.xml'), 'w',
              encoding='utf-8') as f:
        f.write('<?xml version="1.0" encoding="utf-8"?>\n')
        f.write('<resources>\n')
        f.write('    <color name="ic_launcher_background">#FFFFFF</color>\n')
        f.write('</resources>\n')
    print('  values: ic_launcher_background.xml')

    # 仓库用预览图(README 展示), 1024px
    ensure_dir('docs')
    preview = make_square(1024, font_path, 0.68)
    preview.convert('RGB').save('docs/icon.png', optimize=True)
    print('  docs/icon.png (1024px 预览)')

    print('\n--- 居中校验 ---')
    verify_centering(os.path.join(RES, 'mipmap-xxxhdpi', 'ic_launcher.png'),
                     '方形 xxxhdpi')
    verify_centering(
        os.path.join(RES, 'mipmap-xxxhdpi', 'ic_launcher_foreground.png'),
        '自适应前景 xxxhdpi')

    print('\n完成')


main()
