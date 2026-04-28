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