#!/bin/sh
export KAFKA_ZOOKEEPER_CONNECT=zookeeper:32181
export KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092

docker exec -it kafka_kafka_1 kafka-topics --create --bootstrap-server localhost:9092 --topic quickstart-events1 --partitions 100 --replication-factor 1
docker exec -it kafka_kafka_1 kafka-topics --create --bootstrap-server localhost:9092 --topic quickstart-events2 --partitions 100 --replication-factor 1
docker exec -it kafka_kafka_1 kafka-topics --create --bootstrap-server localhost:9092 --topic quickstart-events3 --partitions 100 --replication-factor 1
docker exec -it kafka_kafka_1 kafka-topics --create --bootstrap-server localhost:9092 --topic quickstart-events4 --partitions 100 --replication-factor 1

nohup docker exec kafka_kafka_1 sh -c "yes | kafka-console-producer --topic quickstart-events1 --bootstrap-server localhost:9092" >/dev/null 2>&1 &
nohup docker exec kafka_kafka_1 sh -c "yes | kafka-console-producer --topic quickstart-events2 --bootstrap-server localhost:9092" >/dev/null 2>&1 &
nohup docker exec kafka_kafka_1 sh -c "yes | kafka-console-producer --topic quickstart-events3 --bootstrap-server localhost:9092" >/dev/null 2>&1 &
nohup docker exec kafka_kafka_1 sh -c "yes | kafka-console-producer --topic quickstart-events4 --bootstrap-server localhost:9092" >/dev/null 2>&1 &

nohup docker exec -it kafka_kafka_1 sh -c "kafka-console-consumer --topic quickstart-events1 --bootstrap-server localhost:9092 --from-beginning --group consumer-group1" >/dev/null 2>&1 &
nohup docker exec -it kafka_kafka_1 sh -c "kafka-console-consumer --topic quickstart-events2 --bootstrap-server localhost:9092 --from-beginning --group consumer-group2" >/dev/null 2>&1 &
nohup docker exec -it kafka_kafka_1 sh -c "kafka-console-consumer --topic quickstart-events3 --bootstrap-server localhost:9092 --from-beginning --group consumer-group3" >/dev/null 2>&1 &
nohup docker exec -it kafka_kafka_1 sh -c "kafka-console-consumer --topic quickstart-events4 --bootstrap-server localhost:9092 --from-beginning --group consumer-group4" >/dev/null 2>&1 &

