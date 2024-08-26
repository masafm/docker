FROM httpservice2-micrometer:0.0.1-SNAPSHOT
COPY dd-java-agent-1.38.1.jar dd-java-agent.jar
ENV JAVA_TOOL_OPTIONS="-javaagent:dd-java-agent.jar $JAVA_TOOL_OPTIONS"
