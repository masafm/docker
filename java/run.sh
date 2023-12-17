#!/bin/bash

if [[ ! -d src ]];then
    (git clone git@github.com:masafm/java.git src; cd src/jmx-test; git checkout a6c17998b6255822f541c4ddb4906f1447bff97f)
fi

if [[ ! -f dd-java-agent.jar ]];then
   curl -o dd-java-agent.jar https://repo1.maven.org/maven2/com/datadoghq/dd-java-agent/1.25.1/dd-java-agent-1.25.1.jar
fi

for task in clean build run;do
    echo "Running task name:${task}"
    docker run --rm -u gradle -v "${PWD}/src/jmx-test":/home/gradle/project -v "${PWD}/dd-java-agent.jar:/opt/dd-java-agent.jar" -w /home/gradle/project --network datadog -e DD_AGENT_HOST=datadog-agent -e DD_SERVICE=jmx-test -e DD_SOURCE=java -e DD_VERSION=1.0 -l com.datadoghq.ad.logs="[{\"source\": \"java\", \"service\": \"jmx-test\"}]" gradle:8.5.0-jdk17 gradle $task
    if [[ $? != 0 ]];then
	echo "task:${task} failed!"
	break;
    fi
done
