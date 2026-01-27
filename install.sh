#!/bin/bash

# Скрипт установки Node.js и npm для Linux/macOS

set -e

echo "🔍 Проверка наличия Node.js и npm..."

# Проверка версии Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
    if [ "$NODE_VERSION" -ge 18 ]; then
        echo "✅ Node.js уже установлен: $(node --version)"
        if command -v npm &> /dev/null; then
            echo "✅ npm уже установлен: $(npm --version)"
            echo "✅ Все необходимые зависимости уже установлены!"
            exit 0
        fi
    else
        echo "⚠️  Установлена старая версия Node.js: $(node --version)"
        echo "   Требуется версия 18 или выше"
    fi
fi

echo "📦 Начинаем установку Node.js и npm..."

# Определение операционной системы
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "🍎 Обнаружена macOS"
    
    if command -v brew &> /dev/null; then
        echo "📦 Установка через Homebrew..."
        brew install node
    else
        echo "❌ Homebrew не найден. Установите Homebrew или скачайте Node.js с nodejs.org"
        echo "   Для установки Homebrew выполните: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi
    
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    echo "🐧 Обнаружен Linux"
    
    if command -v apt-get &> /dev/null; then
        echo "📦 Установка через apt (Ubuntu/Debian)..."
        curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
        sudo apt-get install -y nodejs
    elif command -v yum &> /dev/null; then
        echo "📦 Установка через yum (CentOS/RHEL)..."
        curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
        sudo yum install -y nodejs
    elif command -v dnf &> /dev/null; then
        echo "📦 Установка через dnf (Fedora)..."
        curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
        sudo dnf install -y nodejs
    else
        echo "❌ Не удалось определить менеджер пакетов"
        echo "   Пожалуйста, установите Node.js вручную с nodejs.org"
        exit 1
    fi
    
else
    echo "❌ Неподдерживаемая операционная система: $OSTYPE"
    exit 1
fi

# Проверка установки
if command -v node &> /dev/null && command -v npm &> /dev/null; then
    echo ""
    echo "✅ Установка завершена успешно!"
    echo "   Node.js: $(node --version)"
    echo "   npm: $(npm --version)"
else
    echo "❌ Ошибка при установке. Проверьте вывод выше."
    exit 1
fi
