# ---------- build stage ----------
FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /build

# 依存関係キャッシュのため先にコピー
COPY pom.xml .
RUN mvn dependency:go-offline

# ソースコピー
COPY src ./src

# ビルド
RUN mvn clean package -DskipTests


# ---------- run stage ----------
FROM eclipse-temurin:17-jdk

WORKDIR /app

# jarだけコピー
COPY --from=builder /build/target/*.jar app.jar

# ポート
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]