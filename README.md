# @nahui3/web

Web-компоненты для проектов NAHUI (React-библиотека).

## Установка

```bash
# Через npm (после публикации пакета)
npm install @nahui3/web

# Либо напрямую из репозитория
npm install git+https://github.com/nahui3/web.git
```

Библиотека предполагает, что в вашем проекте уже установлены:

- react (>= 18)
- react-dom (>= 18)

## Подключение к React-проекту

Внутри вашего существующего React-приложения:

```tsx
import React from 'react'
import { HelloNahui } from '@nahui3/web'

export function App() {
  return (
    <div style={{ padding: 24 }}>
      <HelloNahui name="NAHUI" />
    </div>
  )
}
```

Компонент `HelloNahui` — демонстрационный, его можно использовать как пример стиля/структуры для остальных компонентов библиотеки.

## Быстрый старт для разработки библиотеки

### Linux/macOS

```bash
# Клонируйте репозиторий
git clone https://github.com/nahui3/web.git
cd web

# Установка зависимостей для разработки
npm install

# Сборка библиотеки
npm run build
```

### Windows

```cmd
REM Клонируйте репозиторий
git clone https://github.com/nahui3/web.git
cd web

REM Установка зависимостей для разработки
npm install

REM Сборка библиотеки
npm run build
```

Собранные файлы будут находиться в папке `dist/` и использоваться как выходные артефакты библиотеки (CJS, ESM и типы).

Подробная документация по проекту и компонентам находится в папке [docs](./docs/README.md).
