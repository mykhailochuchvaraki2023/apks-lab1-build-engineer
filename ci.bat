@echo off
setlocal enabledelayedexpansion

cargo test --release
if errorlevel 1 exit /b 1

cargo build --release
if errorlevel 1 exit /b 1

if not exist dist mkdir dist
copy /Y target\release\hello.exe dist\hello.exe >nul
if errorlevel 1 exit /b 1