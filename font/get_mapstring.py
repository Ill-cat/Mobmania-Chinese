import json5

# 1. 加载 .yy 文件
with open("s_font_zh.yy", "r", encoding="utf-8") as f:
    data = json5.load(f)

# 2. 提取所有字符编码并排序
char_codes = []
for key, glyph in data["glyphs"].items():
    char_codes.append(glyph["character"])
char_codes = sorted(char_codes)

# 3. 转换为字符并生成 mapstring
mapstring = "".join([chr(code) for code in char_codes])

# 4. 写入输出文件
with open("mapstring_output.txt", "w", encoding="utf-8") as f:
    f.write("var mapstring = \"{}\";".format(mapstring))
print("\n\n结果已写入 mapstring_output.txt 文件")