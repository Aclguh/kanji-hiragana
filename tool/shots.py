"""从连接的 Android 设备抓取截图, 裁掉系统栏并压缩到 README 用尺寸。

用法:
    python tool/shots.py NAME [NAME ...]

每个 NAME 形如 01-empty, 会:
  1. adb shell screencap 抓当前屏幕;
  2. 裁掉顶部状态栏与底部导航栏, 只保留应用内容;
  3. 缩放到 540px 宽并保存为 docs/screenshots/NAME.png。
"""

import os
import subprocess
import sys
import tempfile

from PIL import Image

ADB = r"C:\Users\Aclguh\AppData\Local\Android\Sdk\platform-tools\adb.exe"
OUT_DIR = os.path.join("docs", "screenshots")

# 状态栏 / 导航栏高度(物理像素), 由 dumpsys 的 mContentInsets 读出。
TOP_INSET = 111
BOTTOM_INSET = 44

# README 中图片按 260px 显示, 540px 宽相当于 2x, 足够清晰。
TARGET_WIDTH = 540


def capture(name: str) -> None:
    with tempfile.TemporaryDirectory() as tmp:
        raw = os.path.join(tmp, "raw.png")
        remote = "/sdcard/_shot.png"

        subprocess.run(
            [ADB, "shell", "screencap", "-p", remote],
            check=True,
            capture_output=True,
        )
        subprocess.run(
            [ADB, "pull", remote, raw],
            check=True,
            capture_output=True,
        )

        img = Image.open(raw).convert("RGB")
        w, h = img.size

        # 只保留应用自身内容, 去掉状态栏与导航栏。
        cropped = img.crop((0, TOP_INSET, w, h - BOTTOM_INSET))

        # 等比缩放到目标宽度。
        cw, ch = cropped.size
        scale = TARGET_WIDTH / cw
        resized = cropped.resize(
            (TARGET_WIDTH, round(ch * scale)),
            Image.LANCZOS,
        )

        os.makedirs(OUT_DIR, exist_ok=True)
        out = os.path.join(OUT_DIR, name + ".png")
        resized.save(out, "PNG", optimize=True)
        print(f"{name}.png  {resized.size[0]}x{resized.size[1]}  "
              f"{os.path.getsize(out) // 1024}KB")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    for arg in sys.argv[1:]:
        capture(arg)
