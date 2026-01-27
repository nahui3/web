@echo off
REM Скрипт установки Node.js и npm для Windows (Batch)

echo 🔍 Проверка наличия Node.js и npm...

where node >nul 2>&1
if %errorlevel% == 0 (
    echo ✅ Node.js уже установлен
    where npm >nul 2>&1
    if %errorlevel% == 0 (
        echo ✅ npm уже установлен
        echo ✅ Все необходимые зависимости уже установлены!
        exit /b 0
    )
)

echo 📦 Начинаем установку Node.js и npm...

REM Проверка наличия Chocolatey
where choco >nul 2>&1
if %errorlevel% == 0 (
    echo 📦 Установка через Chocolatey...
    choco install nodejs-lts -y
) else (
    echo 📦 Chocolatey не найден. Установка через официальный установщик...
    echo 📥 Скачивание установщика Node.js...
    
    set "NODE_URL=https://nodejs.org/dist/v20.11.0/node-v20.11.0-x64.msi"
    set "INSTALLER_PATH=%TEMP%\nodejs-installer.msi"
    
    powershell -Command "Invoke-WebRequest -Uri '%NODE_URL%' -OutFile '%INSTALLER_PATH%' -UseBasicParsing"
    
    if exist "%INSTALLER_PATH%" (
        echo ✅ Установщик скачан
        echo 🚀 Запуск установщика...
        echo    Пожалуйста, следуйте инструкциям в открывшемся окне установщика
        
        msiexec /i "%INSTALLER_PATH%" /quiet /norestart
        
        del "%INSTALLER_PATH%" >nul 2>&1
    ) else (
        echo ❌ Ошибка при скачивании установщика
        echo    Пожалуйста, установите Node.js вручную с https://nodejs.org/
        exit /b 1
    )
)

timeout /t 2 >nul

where node >nul 2>&1
if %errorlevel% == 0 (
    echo.
    echo ✅ Установка завершена успешно!
    node --version
    where npm >nul 2>&1
    if %errorlevel% == 0 (
        npm --version
    )
) else (
    echo ❌ Node.js не найден. Возможно, требуется перезапустить терминал.
    echo    Или установите Node.js вручную с https://nodejs.org/
    exit /b 1
)
