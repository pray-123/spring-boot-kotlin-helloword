FROM ligaard/jdk17-gradle73

WORKDIR /bh-note-be
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src
RUN chmod +x ./gradlew
RUN ./gradlew bootJar
COPY build/libs/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]

VOLUME /tmp