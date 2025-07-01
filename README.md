# Mobmania-Chinese
一个简单的汉化补丁  

## 使用方法
1. 下载对应版本的e_desc.csv文件
2. 在steam右键游戏[管理->浏览本地文件]进入游戏文件夹(或者直接去X:\steam\steamapps\common\Mobmania
3. 用下载的 e_desc.csv 文件替换掉 原本的 e_desc.csv文件
   
## 注意事项
1. 版本更新后会变回英文
2. 只对武器物品描述有效,其他地方因为没有文件+不支持显示中文,有的没做,有的做了但不推荐替换
3. 游戏中在暂停页面中的武器物品描述不显示中文
4. 大部分是机翻,有更好的翻译帮我改一下

## 本体汉化
汉化效果详情见示例截图  
*如果要做记得先备份    

1. 下载对应版本的data.win(在发布文件里,你应该会解压吧...
2. 在steam右键游戏[管理->浏览本地文件]进入游戏文件夹(或者直接去X:\steam\steamapps\common\Mobmania
3. 用解压后的 data.win 替换原本的 data.win 文件
4. 替换完成后 e_name.csv,t_name.csv,t_desc.csv的中文也可以正常显示,按自己需求决定是否替换

到这里就算完成  
但由于字体库缺少有些字仍然不能正常显示(比如瘴,骷髅,莴苣,哔等)  
游戏本体字体和道具描述字体是两回事  
所以很可惜道具描述的字体缺失只能想办法换个字  
这个方式汉化产生的后果我不负责嘻嘻  
有些地方可能汉化的文本不对或是还没汉化但我懒了  

## 补丁汉化
效果是一样的,但不用再下200MB的文件了,之后的汉化补丁也会以这个方式发布  

1. 下载对应的补丁  
2. 解压到对应的游戏目录下  
3. 把对应的三个文件拖出来  
.  
├── Install.bat  
├── bspatch.exe  
├── data.patch  
└── data.win  
4. 运行Install.bat文件  
5. 提示完成即可  

### 翻译内容注意
机翻  
不必要机翻但是使用了机翻口吻  
ooc  
私货  

## 自己汉化
如果哪天我似了还没有官方中文,你可以自学按以下步骤自己汉化  
(或者现在就想尝尝骨头也行  
*如果要做记得先备份  

需要工具:  
- GameMaker(使用时的版本是v2024.8.1.171,下同)
- Python3(Python 3.10.7)
- UndertaleModTool(v0.8.1.1)
  [指路,非常好用](https://github.com/UnderminersTeam/UndertaleModTool)

### 获取游戏内文本并汉化
1. 到文件目录X:\steam\steamapps\common\Mobmania
2. 用UndertaleModTool打开data.win文件
3. 上边工具栏[Scripts -> Community Scripts -> ExportAllStringsBetter.csx],导出所有的游戏内文本
4. 用顺手的文本编辑器翻译,不会英语就用机翻还是什么之类的方法把疑似是游戏文本的文本汉化(不要汉化到疑似游戏变量或者函数的东西,比如__开头或是驼峰命名),注意不要多加或者多删了双引号逗号之类的  
    4.1 或者你可以进游戏,看到什么文本就在文本编辑器Ctrl+F搜一下
5. 至此你就得到了汉化后的游戏文本文件  
    5.1 不想做这一步可以拿仓库里对应版本的String.txt文件,是99%匠心机翻汉化过的

### 使游戏内可以显示中文
1. 打开GameMaker,新建一个项目
2. 右边右键[创建 - > 字体],叫什么随意,叫s_font_zh的话可以少改
3. 点击[添加],在右边把刚刚汉化文本里的字全粘贴进去,点击[增加范围]
4. 然后选择字体,我使用的是LanaPixel,大小8px,其他没动
5. 左下角[字形 -> 选择字形],把"\\|这三个点掉
6. 回到字体界面,右下角字体页面选一些不需要的奇怪范围的字体,点[删除]去掉
7. 点击[重新生成]生成字体,然后右键右边字体[在资源管理器中打开]
8. 至此,你就得到了字体纹理和字体位置关系的yy文件  
    8.1 不想做这一步可以拿仓库里font文件夹里的s_font_zh.png,s_font_zh.yy文件

### 拆出可以导入游戏的字体Sprites(精灵)
1. 下载仓库里font文件夹里的get_font_png.py文件  
    1.1 如果你改了字体名称记得里面的s_font_zh全改掉
2. 把上一步取得的png和yy文件还有这次的py文件放在同一个文件夹
3. 进文件夹运行py文件(不会自己去查,我也不会  
    3.1 缺什么依赖自己pip下去  
    3.2 这一步会根据png和yy文件拆出每个字单独的png
4. 打开生成的打包文件文件夹,里面有个sprite文件夹,再里面就是字体图片
5. 至此,你就得到了用于导入游戏的字体Sprites  
    5.1 不想做这一步...额,文件有点多,不过也可以在font文件夹里下到

### 正式汉化游戏
1. 下载仓库里font文件夹里的get_mapstring.py文件  
   1.1 如果你改了字体名称记得里面的s_font_zh全改掉
2. 把上上一步取得的yy文件还有这次的py文件放在同一个文件夹
3. 进文件夹运行py文件  
   3.1 这一步会根据yy文件按顺序生成字符串,保留备用  
   3.2 不同的终端的差异可能导致你在复制的时候产生不必要的空格  
   3.3 或者你就用font文件夹里的font_init.js文件  
4. 用UndertaleModTool打开data.win文件(如果你忘了可以把之前步骤的东西都删了
5. 上边工具栏[Scripts -> Community Scripts -> ImportAllStringsBetter.csx],选择你汉化后的游戏文本文件,导入  
   5.1 如果你用的是我的文件,先执行第6步和第7步
6. 上边工具栏[Scripts -> Resource Repackers -> ImportGraphics.csx],选择存放字体精灵的文件夹(打包文件),导入用于游戏内显示的字体
7. 左上角[Filter by name...]输入font
8. 在左边资源管理器,点击[code],点击[gml_GlobalScript_font_init],
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
   8.1 如果你用了其他的字体文件名记得把s_font_zh改掉  
   8.2 如果你用了其他的字体,或者使用了其他的字体范围,不要用font.init.js改
9. 至此,保存一下游戏就算汉化完了,可以进游戏看一下效果  
    9.1 这里再用[Scripts -> Community Scripts -> ExportAllStringsBetter.csx]导出一下就和我用的String.txt文件一样了
### 生成汉化补丁
1. 如果你要创建汉化补丁,需要下载bsdiff文件夹里的bsdiff.exe,bspatch.exe和install.bat文件  
   1.1 感谢[bsdiff-win](https://github.com/reitowo/bsdiff-win),虽然大家好像都知道有这个东西用但我找了半天
2. 终端运行 bsdiff/bsdiff.exe 原data.win 汉化后data.win data.patch
3. 生成完毕后bspatch.exe+install.bat+data.patch即为一个汉化补丁
