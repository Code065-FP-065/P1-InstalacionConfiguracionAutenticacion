# Usamos la imagen oficial de Java 21
FROM eclipse-temurin:21-jdk-alpine

# Directorio donde estará la app dentro del contenedor
WORKDIR /app

# Copiamos el archivo .jar que genera Maven
COPY alquiler-service/target/*.jar app.jar

# Puerto 8080 que es donde corre Spring
EXPOSE 8080

# Comando para arrancar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]