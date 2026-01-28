import * as React from 'react'

export interface HelloNahuiProps {
  /** Текст приветствия, по умолчанию "мир" */
  name?: string
}

/**
 * Простой демонстрационный компонент библиотеки.
 *
 * Пример:
 * ```tsx
 * import { HelloNahui } from '@nahui3/web'
 *
 * export function App() {
 *   return <HelloNahui name="NAHUI" />
 * }
 * ```
 */
export const HelloNahui: React.FC<HelloNahuiProps> = ({ name = 'мир' }) => {
  return (
    <div
      style={{
        padding: '16px 20px',
        borderRadius: 12,
        background: 'linear-gradient(135deg, #111827, #0f766e)',
        color: '#e5e7eb',
        fontFamily:
          'system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif',
        boxShadow: '0 18px 40px rgba(15, 23, 42, 0.55)',
      }}
    >
      <div
        style={{
          fontSize: 12,
          textTransform: 'uppercase',
          letterSpacing: 1.2,
          opacity: 0.7,
        }}
      >
        NAHUI Web
      </div>
      <div style={{ fontSize: 20, fontWeight: 600, marginTop: 4 }}>
        Привет, {name}
      </div>
      <div style={{ fontSize: 13, marginTop: 8, opacity: 0.85 }}>
        Это компонент из npm-библиотеки <code>@nahui3/web</code>. Подключите
        его в своём React-проекте и начните собирать интерфейсы.
      </div>
    </div>
  )
}

export default HelloNahui

