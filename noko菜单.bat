@echo off
chcp 65001 >nul
title Noko 菜单 - LunarCore
cd /d "%~dp0"
:menu
cls
echo ============================================
echo            Noko 菜单 - LunarCore
echo ============================================
echo   [1] 启动服务器
echo   [2] 重启服务器
echo   [3] 查看状态
echo   [4] 退出
echo ============================================
set /p choice=请输入选项 (1/2/3/4):
if "%choice%"=="1" goto start
if "%choice%"=="2" goto restart
if "%choice%"=="3" goto status
if "%choice%"=="4" exit
echo 输入错误
pause
goto menu
:start
echo 正在启动...
start "LunarCore" java -jar LunarCore.jar
pause
goto menu
:restart
echo 正在重启...
taskkill /f /im java.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start "LunarCore" java -jar LunarCore.jar
pause
goto menu
:status
tasklist | findstr /i "java.exe"
pause
goto menu
