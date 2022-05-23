FROM anapsix/alpine-java

MAINTAINER grouptest1

COPY ./target/nexustest2-2.0.*-SNAPSHOT.jar /opt/

CMD ["java", "-jar", "/opt/*.jar"]

EXPOSE 8080:8080
