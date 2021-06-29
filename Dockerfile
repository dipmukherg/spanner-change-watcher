FROM maven:3.6.0-jdk-11-slim AS build
COPY pom.xml .
COPY ./google-cloud-spanner-change-archiver/pom.xml ./google-cloud-spanner-change-archiver/pom.xml
COPY ./google-cloud-spanner-change-publisher/pom.xml ./google-cloud-spanner-change-publisher/pom.xml
COPY ./google-cloud-spanner-change-watcher/pom.xml ./google-cloud-spanner-change-watcher/pom.xml
COPY .samples/spanner-change-publisher-samples/pom.xml ./spanner-change-publisher-samples/pom.xml
ADD samples/spanner-change-publisher-samples/target/spanner-change-publisher.jar spanner-change-publisher.jar
ENTRYPOINT ['java','-jar','spanner-change-publisher.jar']