FROM gradle:7.5-jdk17 as build
WORKDIR /app
COPY . .
run gradle build --no-daemon

FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/build/libs/*.jar  /app/notificacao.jar

EXPOSE 8084
CMD ["java", "-jar", "/app/notificacao.jar"]