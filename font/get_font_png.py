import os
import json5
from PIL import Image

# 1. 读取 .yy 文件中的 glyphs 数据
with open("s_font_zh.yy", "r", encoding="utf-8") as f:
    data = json5.load(f)
    glyphs = data["glyphs"]

# 2. 打开原字体 PNG
img = Image.open("s_font_zh.png")

# 3. 创建输出目录（修改为/打包文件/sprite）
output_dir = os.path.join("打包文件", "sprite")
os.makedirs(output_dir, exist_ok=True)

# 4. 遍历 glyphs，切割每个字符并保存（按顺序编号）
for index, (char_code, glyph) in enumerate(glyphs.items()):
    x, y, w, h = glyph["x"], glyph["y"], glyph["w"], glyph["h"]
    char_img = img.crop((x, y, x + w, y + h))
    char_img.save(os.path.join(output_dir, f"s_font_zh_{index}.png"))  # 使用完整路径

print(f"共导出 {len(glyphs)} 个字符图片到 {output_dir} 目录")