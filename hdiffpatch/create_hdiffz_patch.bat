@echo off
chcp 65001 > nul
title 补丁制作工具

@REM 检查是否拖入了两个文件
if "%~2"=="" (
    echo 用法：将本bat文件和原始win文件、修改后win文件拖到本窗口
    echo 示例：create_hdiffz_patch.bat "原始.win" "修改后.win"
    pause
    exit /b
)

set "original_file=%~1"
set "modified_file=%~2"

@REM 检查文件是否存在
if not exist "%original_file%" (
    echo 错误：原始文件不存在 - %original_file%
    pause
    exit /b
)

if not exist "%modified_file%" (
    echo 错误：修改后文件不存在 - %modified_file%
    pause
    exit /b
)

@REM 生成补丁文件（改用hdiffz，启用压缩）
echo 正在创建补丁文件...
hdiffz.exe -f "%original_file%" "%modified_file%" data.patch
if errorlevel 1 (
    echo 补丁创建失败！
    pause
    exit /b
)

@REM 计算哈希值并正确提取
echo 正在计算文件哈希值...
for /f "skip=1 tokens=1" %%a in ('certutil -hashfile "%original_file%" MD5') do (
    if not "%%a"=="CertUtil:" set "original_hash=%%a"
)
for /f "skip=1 tokens=1" %%a in ('certutil -hashfile "%modified_file%" MD5') do (
    if not "%%a"=="CertUtil:" set "modified_hash=%%a"
)
for /f "skip=1 tokens=1" %%a in ('certutil -hashfile "data.patch" MD5') do (
    if not "%%a"=="CertUtil:" set "patch_hash=%%a"
)

@REM 验证哈希值是否获取成功
if not defined original_hash (
    echo 错误：无法获取原始文件哈希值
    pause
    exit /b
)
if not defined modified_hash (
    echo 错误：无法获取修改后文件哈希值
    pause
    exit /b
)
if not defined patch_hash (
    echo 错误：无法获取补丁文件哈希值
    pause
    exit /b
)

@REM 保存为纯文本
(
echo %original_hash%
echo %modified_hash%
echo %patch_hash%
) > file_hash.txt

echo.
echo 补丁创建完成！
echo 生成的文件：data.patch 和 file_hash.txt
echo 哈希值: %original_hash%,%modified_hash%,%patch_hash%
pause