dd_trace_lib=https://repo1.maven.org/maven2/com/datadoghq/dd-java-agent/1.38.1/dd-java-agent-1.38.1.jar
for d in httpservice1-micrometer httpservice2-micrometer; do
    wget -O $d/dd-java-agent.jar $dd_trace_lib
done
JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64 /opt/apache-maven-3.9.9/bin/mvn clean
JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64 /opt/apache-maven-3.9.9/bin/mvn spring-boot:build-image
docker compose build
