# java
How to run
```
git clone https://github.com/masafm/docker.git
cd docker/java
git checkout 20231218
docker-compose build
DD_HOSTNAME=docker-java DD_API_KEY=${DD_API_KEY} TARGET_URL=http://www.datadoghq.com/ docker-compose up
```
