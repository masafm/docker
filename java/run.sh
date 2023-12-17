#!/bin/bash

if [[ $1 == clean ]];then
    rm -rf src dd-java-agent.jar
fi

if [[ ! -d src ]];then
    (git clone https://github.com/masafm/java.git src; cd src/jmx-test; git checkout gradle)
fi

if [[ ! -f dd-java-agent.jar ]];then
   curl -o dd-java-agent.jar https://repo1.maven.org/maven2/com/datadoghq/dd-java-agent/1.25.1/dd-java-agent-1.25.1.jar
fi

docker run --rm -u gradle \
       -v "${PWD}/src/jmx-test":/home/gradle/project \
       -v "${PWD}/dd-java-agent.jar:/opt/dd-java-agent.jar" \
       -w /home/gradle/project \
       --network datadog \
       -e DD_AGENT_HOST=datadog-agent \
       -l com.datadoghq.ad.logs="[{\"source\": \"java\", \"service\": \"jmx-test\"}]" \
       gradle:8.5.0-jdk17-focal \
       gradle build run
