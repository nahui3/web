import { useState } from 'react'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <div className="App">
      <header className="App-header">
        <h1>Добро пожаловать в React!</h1>
        <div className="card">
          <button onClick={() => setCount((count) => count + 1)}>
            Счетчик: {count}
          </button>
          <p>
            Отредактируйте <code>src/App.jsx</code> и сохраните для перезагрузки
          </p>
        </div>
      </header>
    </div>
  )
}

export default App
