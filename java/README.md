# java
How to run
```
docker network create datadog
docker run -d --cgroupns host --pid host --name datadog-agent -v /var/run/docker.sock:/var/run/docker.sock:ro -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e DD_API_KEY=${DD_API_KEY} --network datadog gcr.io/datadoghq/agent:7
git clone https://github.com/masafm/docker.git
cd docker/java
git checkout 20231217
docker-compose build
docker-compose up
```
