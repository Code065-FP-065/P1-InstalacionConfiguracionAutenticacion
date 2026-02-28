# ---------- Fase 1: build (compilar con Maven) ----------
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app

# Copiamos primero el pom para aprovechar caché de dependencias
COPY pom.xml .
RUN mvn -q -e -DskipTests dependency:go-offline

# Copiamos el código y compilamos
COPY src ./src
RUN mvn -q -DskipTests clean package

# ---------- Fase 2: runtime (ejecutar con JRE) ----------
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copiamos el jar generado
COPY --from=build /app/target/*.jar app.jar

# Puerto por defecto de Spring Boot
EXPOSE 8080

# Ejecuta la app
ENTRYPOINT ["java","-jar","app.jar"]