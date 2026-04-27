## プロジェクト構成

### 1. ディレクトリ作成  
cicd-demo/  
├──.devcontainer  
├── backend/  
├── frontend/  
└── docker-compose.yml

### 2. docker-compose.yml作成

### 3. .devcontainer作成

## バックエンド

### 1. Dev Containers起動
```bash
# コマンドパレットを開く  
Ctrl + Shift + P

# Dev Containers起動
Dev Containers: Open Folder in Container...
```

### 2. プロジェクト作成

```bash
# コマンドパレットを開く  
Ctrl + Shift + P

# Spring Initializr起動  
Create a Maven Project

# Specify Spring Boot version
4.0.6

# Specify project language
Java

# Input Group Id
com.hrtk

# Artifact Id
demo

# Package Name
com.hrtk.demo

# Specify packaging type
Jar

# Specify Java version
17

# Search for dependencies
Spring Web
```

### 3. HelloController.java作成
```java
package com.hrtk.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() {
        return "hello world";
    }
}
```

### 4. 起動
```bash
# 前回ビルド結果の削除
mvn clean

# アプリ起動
mvn spring-boot:run
```

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