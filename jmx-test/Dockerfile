FROM gradle:8.5.0-jdk17-focal
RUN apt update -y && apt install -y curl git && apt clean
#RUN git clone https://github.com/masafm/java.git /home/gradle/src; cd src/jmx-test; git checkout main #latest
RUN git clone https://github.com/masafm/java.git /home/gradle/src; cd src/jmx-test; git checkout aeedbda889ba83a90a3879ffec53df75d5220fec #stable
WORKDIR /home/gradle/src/jmx-test
RUN curl -o /opt/dd-java-agent.jar https://repo1.maven.org/maven2/com/datadoghq/dd-java-agent/1.25.1/dd-java-agent-1.25.1.jar
ENV TARGET_URL http://localhost:8080/
RUN gradle build
CMD gradle run
