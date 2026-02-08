FROM eclipse-temurin:8-jre
WORKDIR /app
COPY build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-Xmx512m","-jar","app.jar"]

