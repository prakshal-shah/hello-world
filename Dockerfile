FROM anapsix/alpine-java

MAINTAINER grouptest1

COPY nexustest2-2.0.BID-SNAPSHOT.jar /opt/nexustest2-2.0.BID-SNAPSHOT.jar

CMD ["java", "-jar", "/opt/nexustest2-2.0.BID-SNAPSHOT.jar"]

EXPOSE 8080:8080
