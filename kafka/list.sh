#!/bin/sh
docker exec -it kafka kafka-consumer-groups --bootstrap-server kafka:9092 --list
docker exec -it kafka kafka-consumer-groups --bootstrap-server kafka:9092 --group consumer-group1 --describe
