# Datagen Connector Example

This project demonstrates how to use the [Datagen Source Connector](https://docs.confluent.io/kafka-connectors/datagen/current/overview.html) to generate sample data and publish it into Kafka topics. The Datagen connector is useful for testing, demos, and learning Kafka without the need for external data sources.

## Prerequisites

This example assumes you have the following components running:

- Apache Kafka
- Kafka Connect
- Schema Registry

A Docker Compose file is provided to set up the necessary services. You can start the services with:

```bash
docker-compose up -d
```

## Creating the necessary topic

This project requires one Kafka topic. You can create it using the following CLI commands:

> ⚠️ Make sure your Kafka broker is running on localhost:9092. Adjust the --bootstrap-server parameter if needed.

```bash
    kafka-topics \
    --bootstrap-server localhost:9092 \
    --create \
    --topic credit-cards-topic \
    --replication-factor 1 \
    --partitions 3
```

## Configuring the Datagen Source Connector

To configure the Datagen Source connector, you can use the [create-source-connector.http](create-source-connector.http) file.

### Datagen Connector Parameters

| Parameter         | Description                                                                                           | Default |
|-------------------|-------------------------------------------------------------------------------------------------------|---------|
| `kafka.topic`     | The topic to write to                                                                                 | ""      |
| `max.interval`    | The maximum interval between messages (ms)                                                            | 500     |
| `iterations`      | The number of messages to send from each task, or -1 for unlimited                                    | -1      |
| `schema.string`   | The literal JSON-encoded Avro schema to use. This can’t be set with `schema.filename` or `quickstart` | ""      |
| `schema.filename` | The filename of schema to use. This can’t be set with `schema.string` or `quickstart`                 | ""      |
| `schema.keyfield` | The name of field to use as the message key                                                           | ""      |
| `quickstart`      | The name of `quickstart` to use. This can’t be set with `schema.string` or `schema.filename`          | ""      |