FROM openjdk:17-jdk

WORKDIR /app

COPY out/artifacts/test_jar/test.jar /app/test.jar

CMD ["java", "-jar", "test.jar"]