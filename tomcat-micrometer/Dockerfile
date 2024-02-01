FROM gradle:8.5.0-jdk17-focal AS builder
RUN apt update -y && apt install -y curl git && apt clean
#RUN git clone https://github.com/masafm/java.git /home/gradle/src; cd src/tomcat; git checkout main #latest
RUN git clone https://github.com/masafm/java.git /home/gradle/src; cd src/tomcat; git checkout micrometer #stable
WORKDIR /home/gradle/src/tomcat
COPY log4j2.xml /home/gradle/src/tomcat/app/src/main/resources/
COPY logback.xml /home/gradle/src/tomcat/app/src/main/resources/
RUN gradle war

FROM tomcat:10-jdk17
COPY --from=builder /home/gradle/src/tomcat/app/build/libs/app-plain.war /usr/local/tomcat/webapps/ROOT.war
RUN curl -o dd-java-agent.jar https://repo1.maven.org/maven2/com/datadoghq/dd-java-agent/1.25.1/dd-java-agent-1.25.1.jar
ENV JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=9012 -Dcom.sun.management.jmxremote.authenticate=false -javaagent:/usr/local/tomcat/dd-java-agent.jar -Ddd.profiling.enabled=true -XX:FlightRecorderOptions=stackdepth=256 -Ddd.logs.injection=true"
ENV TARGET_URL http://localhost/
