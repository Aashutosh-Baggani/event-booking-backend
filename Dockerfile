FROM gradle:4.9-jdk8 AS build
WORKDIR /app
COPY . .
RUN gradle clean bootRepackage -x test

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]