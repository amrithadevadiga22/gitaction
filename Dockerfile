FROM gradle:7.4.2-alpine as builder
WORKDIR /home/app
COPY . .
RUN gradle --no-daemon build

FROM openjdk:8-jre-alpine as my-app
WORKDIR /app
COPY --from=builder /home/app/MyApp/build/libs/MyApp-1.0-SNAPSHOT.jar /app/
ENTRYPOINT ["java", "-jar", "/app/MyApp-1.0-SNAPSHOT.jar"]

#ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","my-app-1.0-SNAPSHOT.jar"]
