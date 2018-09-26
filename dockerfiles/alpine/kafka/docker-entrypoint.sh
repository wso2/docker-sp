#!/bin/bash

echo "Starting Zookeeper"

nohup ./kafka_2.11-0.10.0.0/bin/zookeeper-server-start.sh kafka_2.11-0.10.0.0/config/zookeeper.properties > /dev/null 2>&1 &

while ! nc -z localhost 2181; do   
  sleep 1
done

echo "Starting Kafka"

./kafka_2.11-0.10.0.0/bin/kafka-server-start.sh kafka_2.11-0.10.0.0/config/server.properties

