@echo off
chcp 65001 > nul
title 补丁安装工具

@REM 初始化变量
set "original_hash="
set "modified_hash="
set "patch_hash="
set "use_backup=0"

@REM 检查必要文件
if not exist "file_hash.txt" (
    echo 错误：缺少 file_hash.txt 文件！
    pause
    exit /b
)

if not exist "data.hdiff" (
    echo 错误：缺少 data.hdiff 文件！
    pause
    exit /b
)

@REM 从file_hash.txt中读取哈希值
setlocal enabledelayedexpansion
set /a count=0
for /f "tokens=*" %%a in (file_hash.txt) do (
    set /a count+=1
    if !count!==1 set "original_hash=%%a"
    if !count!==2 set "modified_hash=%%a"
    if !count!==3 set "patch_hash=%%a"
)
endlocal & (
    set "original_hash=%original_hash%"
    set "modified_hash=%modified_hash%"
    set "patch_hash=%patch_hash%"
)

@REM 验证data.win状态
if not exist "data.win" (
    echo 错误：找不到 data.win 文件！
    pause
    exit /b
)

echo 正在验证文件哈希值...
certutil -hashfile "data.win" MD5 | find /v ":" > current_hash.txt
set /p current_hash=<current_hash.txt
set "current_hash=%current_hash: =%"
del current_hash.txt

echo [调试] 当前文件哈希: %current_hash%
echo [调试] 原始文件哈希: %original_hash%
echo [调试] 修改后哈希: %modified_hash%

if "%current_hash%"=="%original_hash%" (
    echo 验证通过：data.win 是原始文件
    set "valid_source=1"
) else if "%current_hash%"=="%modified_hash%" (
    echo 错误：data.win 已经是汉化版本！
    pause
    exit /b
) else (
    echo 警告：data.win 不是原始版本，检查备份文件...
    if exist "data.win.bak" (
        certutil -hashfile "data.win.bak" MD5 | find /v ":" > backup_hash.txt
        set /p backup_hash=<backup_hash.txt
        set "backup_hash=%backup_hash: =%"
        del backup_hash.txt
        
        echo [调试] 备份文件哈希: %backup_hash%
        
        if "%backup_hash%"=="%original_hash%" (
            echo 使用备份文件 data.win.bak 作为源文件
            set "valid_source=1"
            set "use_backup=1"
        ) else (
            echo 错误：data.win.bak 也不是原始版本！
            echo 没有找到适合此补丁的文件
            pause
            exit /b
        )
    ) else (
        echo 错误：没有找到适合此补丁的文件
        pause
        exit /b
    )
)

@REM 验证补丁文件
certutil -hashfile "data.hdiff" MD5 | find /v ":" > current_patch_hash.txt
set /p current_patch_hash=<current_patch_hash.txt
set "current_patch_hash=%current_patch_hash: =%"
del current_patch_hash.txt

echo [调试] 当前补丁哈希: %current_patch_hash%
echo [调试] 预期补丁哈希: %patch_hash%

if not "%current_patch_hash%"=="%patch_hash%" (
    echo 错误：补丁文件无效，请重新下载或联系制作者！
    pause
    exit /b
)

@REM 备份原始文件
if "%use_backup%"=="0" (
    echo 备份原始文件...
    copy "data.win" "data.win.bak" > nul
)

@REM 应用补丁（改用hpatchz，启用强制覆盖）
echo 正在应用汉化补丁...
if "%use_backup%"=="1" (
    hpatchz.exe -f "data.win.bak" "data.hdiff" "data.win"
) else (
    hpatchz.exe -f "data.win" "data.hdiff" "data.win"
)

@REM 验证结果
certutil -hashfile "data.win" MD5 | find /v ":" > patched_hash.txt
set /p patched_hash=<patched_hash.txt
set "patched_hash=%patched_hash: =%"
del patched_hash.txt

echo [调试] 补丁后文件哈希: %patched_hash%
echo [调试] 预期最终哈希: %modified_hash%

if "%patched_hash%"=="%modified_hash%" (
    echo 汉化成功完成！
) else (
    echo 错误：汉化失败，文件哈希不匹配！
    if "%use_backup%"=="0" (
        echo 正在恢复备份...
        move /y "data.win.bak" "data.win" > nul
    )
)

pause