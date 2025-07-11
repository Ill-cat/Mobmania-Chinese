# Mobmania-Chinese  
一个简单的汉化补丁  
汉化效果详情见示例截图  
  
## 使用方法  
  
### 简单汉化  
1. 下载对应版本的`e_desc.csv`文件  
2. 在steam右键游戏[`管理` → `浏览本地文件`]进入游戏文件夹  
   - 或者直接去`X:\steam\steamapps\common\Mobmania`  
3. 用下载的`e_desc.csv`文件替换掉*原本的*`e_desc.csv`文件  
   
### 注意事项
1. 版本更新后若涉及到物品描述会变回英文,**需要等待新版本汉化**  
2. 只对武器物品描述有效,其他地方因为没有文件+不支持显示中文,**如果不进行本体汉化,其他文件的中文不会显示**  
3. 游戏中在暂停页面中的武器物品描述不会显示中文  
4. 大部分是机翻,有更好的翻译帮我改一下  
5. 自走棋因为官方暂时不开放了,这部分没有汉化
  
## 本体汉化  
  
0. 使用前建议备份`data.win`文件,虽然补丁安装程序也会备份一份  
1. **下载文件**  
    - 从链接下载以下文件： 
      - `csv_[版本号].zip`  
      - `mobmania.[版本号].zip`  
2. **定位游戏目录**  
    - *方法1（Steam）*:  
     右键游戏 → `管理` → `浏览本地文件`  
    - *方法2（手动）*:  
     直接访问：  
     `X:\steam\steamapps\common\Mobmania`  
3. **覆盖CSV文件**  
    - 解压 `csv_[版本号].zip`  
    - 替换游戏目录内对应文件  
        > 可选：若只需道具描述汉化，**仅替换** `e_desc.csv` 即可  
        > （其他三个csv文件可不替换）
4. **准备补丁文件**  
    - 解压 `mobmania.[版本号].zip`  
    - 将内容放入游戏目录，结构应为： 
```
.
├── Install.bat/Install_hdiffz.bat
├── bspatch.exe/hpatchz.exe
├── data.patch/data.hdiff
├── file_hash.txt
└── data.win
```
- 斜杠后是我用`bsdiff`打补丁失败后换`HDiff`打的补丁后用的文件名,只要注意不混用就行
5. **运行安装**  
   - 双击运行 `Install.bat`/`Install_hdiffz.bat`  
   - 提示完成即可  
6. 应该没什么好注意的但反正:  
    如果不执行上一步骤  
    `e_name.csv`,`t_name.csv`,`t_desc.csv`的中文是不能正常显示的  
    如果执行了,也是按自己需求决定是否替换就好  

**碎碎念**  
1. `Install.bat`运行过程中,会为原本的`data.win`备份`data.win.bak`,如果执行后发现无法运行等问题请删除`data.win`文件,将`data.win.bak`重新命名为`data.win`  
2. 如果多次运行了`Install.bat`,请在steam右键游戏:
   `属性` → `已安装文件` → `验证游戏文件的完整性`  
3. 由于字体库缺少有些字仍然不能正常显示(比如瘴,骷髅,莴苣,哔等),已替换为其它词汇(但打嗝这种没啥好替换的我就没办法了)  
4. 这个方式汉化产生的后果我不负责嘻嘻  
5. 有些地方可能汉化的文本不对或是还没汉化但我懒了,一般我会等到下次游戏更新  
6. 个人习惯不汉化人名  

### 翻译内容注意
机翻  
不必要机翻但是使用了机翻口吻  
ooc  
私货  

---

# 自己汉化
如果哪天我似了还没有官方中文,你可以自学按以下步骤自己汉化   
*如果要做记得先备份`data.win`文件  
`*.csv`文件非常容易汉化这里不讲  

需要工具:  
- GameMaker(使用时的版本是v2024.8.1.171,下同)
- Python3(Python 3.10.7)
- UndertaleModTool(v0.8.1.1)
  [指路,非常好用](https://github.com/UnderminersTeam/UndertaleModTool)

## 获取游戏内文本并汉化
1. 到文件目录`X:\steam\steamapps\common\Mobmania`  
2. 用`UndertaleModTool`打开`data.win`文件  
3. 上边工具栏[`Scripts` → `Community Scripts` → `ExportAllStringsBetter.csx`],导出所有的游戏内文本
4. 用顺手的文本编辑器翻译,不会英语就用机翻还是什么之类的方法把疑似是游戏文本的文本汉化(不要汉化到疑似游戏变量或者函数的东西,比如__开头或是驼峰命名),注意不要多加或者多删了双引号逗号之类的  
    - 或者你可以进游戏,看到什么文本就在文本编辑器`Ctrl+F`搜一下
5. 至此你就得到了汉化后的游戏文本文件  
    - 不想做这一步可以拿仓库里对应版本的`String.txt`文件,是99%匠心机翻汉化过的

## 创建游戏内显示的中文字体
1. 打开`GameMaker`,新建一个项目
2. 右边右键[`创建` → `字体`],叫什么随意,叫`s_font_zh`的话可以少改
3. 点击[添加],在右边把刚刚汉化文本里的字全粘贴进去,点击[增加范围]
4. 然后选择字体,我使用的是`LanaPixel`,大小8px,其他没动
5. 左下角[字形 → 选择字形],把`"\|`这三个点掉
6. 回到字体界面,右下角字体页面选一些不需要的奇怪范围的字体,点[`删除`]去掉
7. 点击[`重新生成`]生成字体,然后右键右边字体[`在资源管理器中打开`]
8. 至此,你就得到了字体纹理和字体位置关系的`yy文件`  
    - 不想做这一步可以拿仓库里`font`文件夹里的`s_font_zh.png`,`s_font_zh.yy`文件

## 拆出可以导入游戏的字体Sprites(精灵)
1. 下载仓库里`font`文件夹里的`get_font_png.py`文件  
    - 如果你改了字体名称记得里面的`s_font_zh`全改掉
2. 把`创建游戏内显示的中文字体`取得的png和yy文件还有这次的py文件放在同一个文件夹
3. 进文件夹运行`py文件`  
```
python get_font_png.py  
```

- 缺什么依赖自己`pip **`下去  
- 这一步会根据png和yy文件拆出`每个字单独的png`  
4. 打开生成的打包文件文件夹,里面有个`sprite`文件夹,再里面就是`字体图片`
5. 至此,你就得到了用于导入游戏的`字体Sprites`  
    - 不想做这一步...额,文件有点多,不过也可以在`font`文件夹里下到

## 正式汉化游戏
1. 下载仓库里`font文`件夹里的`get_mapstring.py`文件  
   - 如果你改了字体名称记得里面的`s_font_zh`全改掉  
2. 把`创建游戏内显示的中文字体`取得的`yy文件`还有这次的`py文件`放在同一个文件夹
3. 进文件夹运行py文件  
```
python get_mapstring.py  
```
   - 这一步会根据yy文件按顺序生成字符串,生成于`mapstring_output.txt`文件里  
   - 或者你就用font文件夹里的font_init.js文件  
4. 用`UndertaleModTool`打开`data.win`文件
5. 上边工具栏[`Scripts` → `Community Scripts` → `ImportAllStringsBetter.csx`],选择你汉化后的游戏文本文件,导入  
   - **如果你用的是我的文件,先执行第6步和第7步**
6. 上边工具栏[`Scripts` → `Resource Repackers` → `ImportGraphics.csx`],选择存放字体精灵的文件夹(打包文件),导入用于游戏内显示的字体
7. 左上角[`Filter by name...`]输入`font`
8. 在左边资源管理器,点击[`code`],点击[`gml_GlobalScript_font_init`],
   把
   ```
   var mapstring = "ABCDEFGHIJKLMNOPQRSTUVWXYZ !'#$%&'()*+,-./:;<=>?@[]^_`{}'0123456789abcdefghijklmnopqrstuvwxyz";  
   global.font = font_add_sprite_ext(s_font, mapstring, true, 1);
   ```
   替换成
   ```
   //通过get_mapstring.py生成的字符串
   var mapstring = "...";
   global.font = font_add_sprite_ext(s_font_zh, mapstring, true, 1);
   ```  
   - 如果你用了其他的字体文件名记得把`s_font_zh`改掉  
   - 如果你用了其他的字体,或者使用了其他的字体范围,不要用`font_init.js`改
9.  至此,保存一下游戏就算汉化完了,可以进游戏看一下效果  
    - 这里再用[`Scripts` → `Community Scripts` → `ExportAllStringsBetter.csx`]导出一下就和我用的`String.txt`文件一样了

## 生成汉化补丁

### 使用bsdiff
0. 如果你要创建汉化补丁,需要下载`bsdiff`文件夹,确认有`bsdiff.exe`,`bspatch.exe`和`Install.bat`,`Create_patch.bat`文件  
    - 感谢[bsdiff-win](https://github.com/reitowo/bsdiff-win),虽然大家好像都知道有这个东西用但我找了半天  
   - 
1. 在`bsdiff`目录下运行终端[`右键` → `在终端中打开`]  
2. 依次拖入`Create_patch.bat`,`原始data.win`,`汉化后data.win`,各文件之间留有空格 
   ```
   Create_patch.bat 原始data.win 汉化后data.win
   ```  
3. 运行,将生成`file_hash.txt`和`data.patch`文件  
- `file_hash.txt`用于确认文件汉化进度和补丁可用性  
4. `bspatch.exe`,`install.bat`,`data.patch`,`file_hash.txt`压缩后即为一个汉化补丁  


### 使用HDiffOatch
[HDiffPatch](https://github.com/sisong/HDiffPatch/tree/master)
0. 需要下载`hdiffpatch`文件夹,确认有`hdiffz.exe`,`hpatchz.exe`和`Install_hdiffz.bat`,`Create_hdiffz_patch.bat`文件
   - 比较新,被deepseek推去用了,虽然不压缩补丁大一点,但生成速度快,也可以解决`bsdiff`一些比较莫名其妙的问题  
   - 其实步骤和`bsdiff`生成补丁方式一样,我也不知道我为什么要换个名字  
1. 在`hdiffpatch`目录下运行终端[`右键` → `在终端中打开`]  
2. 依次拖入`Create_hdiffz_patch.bat`,`原始data.win`,`汉化后data.win`,各文件之间留有空格 
   ```
   Create_hdiffz_patch.bat 原始data.win 汉化后data.win
   ```  
3. 运行,将生成`file_hash.txt`和`data.hdiff`文件  
- `file_hash.txt`用于确认文件汉化进度和补丁可用性  
4. `hpatchz.exe`,`Install_hdiffz.bat`,`data.hdiff`,`file_hash.txt`压缩后即为一个汉化补丁 
