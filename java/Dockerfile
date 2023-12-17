FROM gradle:8.5.0-jdk17-focal
RUN apt update -y && apt install -y curl git && apt clean
RUN git clone https://github.com/masafm/java.git /home/gradle/src; cd src/jmx-test; git checkout gradle
WORKDIR /home/gradle/src/jmx-test
RUN curl -o /opt/dd-java-agent.jar https://repo1.maven.org/maven2/com/datadoghq/dd-java-agent/1.25.1/dd-java-agent-1.25.1.jar
ENV TARGET_URL=http://www.datadoghq.com/
RUN gradle build
CMD gradle run
