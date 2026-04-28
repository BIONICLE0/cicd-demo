## フロントエンド

### 1. Dev Containers起動
```bash
# コマンドパレットを開く  
Ctrl + Shift + P

# Dev Containers起動
Dev Containers: Open Folder in Container...
```

### 2. プロジェクト作成

```bash
# プロジェクト作成
npm create vite@latest app -- --template react
```

### 3. パッケージインストール
cd /workspace/app
npm install react-router-dom
npm install -D tailwindcss @tailwindcss/vite

### 4. vite.config.js修正
```json
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
  ],
  server: {
    host: '0.0.0.0',
    port: 3000,
    watch: {
      usePolling: true
    }
  }
})
```

### 5. App.jsx修正

```jsx
function App() {
  return <h1>Hello World</h1>;
}

export default App;
```

### 6. 起動手順
```bash
# 起動
cd /workspace/app  
npm run dev
```