# File Connector

This project demonstrates how to use Kafka Connect with the File [Source](https://docs.confluent.io/kafka-connectors/spooldir/current/overview.html) and [Sink](https://camel.apache.org/camel-kafka-connector/4.10.x/reference/connectors/camel-file-kafka-sink-connector.html) connectors to read data from local files and write data to files. In this example, we set up a File Source connector to read data from a `/input` directory and send it to a Kafka topic, and a File Sink connector to read data from this topic and write it to another `/output` directory.

## Prerequisites

This example assumes you have the following components running:
- Apache Kafka
- Kafka Connect

A Docker Compose file is provided to set up the necessary services. You can start the services with:

```bash
docker-compose up -d
```

## Configuring the File Source Connector

To configure the File Source connector, you can use the [create-source-connector.http](create-source-connector.http) file.

## Configuring the File Sink Connector

To configure the File Sink connector, you can use the [create-sink-connector.http](create-sink-connector.http) file.