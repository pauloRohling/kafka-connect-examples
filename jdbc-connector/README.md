# JDBC Connector

This project demonstrates how to use Kafka Connect with the [JDBC Source and Sink connectors](https://docs.confluent.io/kafka-connectors/jdbc/current/overview.html) to read from and write to a PostgreSQL database. For this example, we will set up a JDBC Source connector to pull data from a PostgreSQL table `leads` and push it to a Kafka topic, and a JDBC Sink connector to read data from this Kafka topic and write it back to another PostgreSQL table `customers`.

## Prerequisites

This example assumes you have the following components running:
- Apache Kafka
- Kafka Connect
- PostgreSQL database
- Schema Registry (if using Avro or other schema-based formats)

A Docker Compose file is provided to set up the necessary services. You can start the services with:

```bash
docker-compose up -d
```

It is important to notice that the PostgreSQL database is initialized with a sample table and data. You can find the initialization script in the [init.sql](init.sql) file.

## Configuring the JDBC Source Connector

To configure the JDBC Source connector, you can use the [create-source-connector.http](create-source-connectors.http) file. We are using the `mode` as `incrementing` with the `incrementing.column.name` set to `id`, which ensures that only new rows are fetched based on the incrementing `id` column. Below are some points to consider:

### Using Primary Key as Kafka Message Key

To use the primary key column of the `leads` table as the Kafka message key, you need to configure the connector with the appropriate transforms. Below is an example configuration snippet to include in your connector configuration:

```json
{
  "transforms":"createKey,extractInt",
  "transforms.createKey.type":"org.apache.kafka.connect.transforms.ValueToKey",
  "transforms.createKey.fields":"id",
  "transforms.extractInt.type":"org.apache.kafka.connect.transforms.ExtractField$Key",
  "transforms.extractInt.field":"id"
}
```

### Configuring Schema Registry

When working with schemas in JDBC connectors, it's important to configure the Schema Registry url for both key and value converters. Below are the necessary configurations to include in your connector configuration:

```json
{
  "key.converter": "io.confluent.connect.avro.AvroConverter",
  "key.converter.schema.registry.url": "http://schema-registry:8081",
  "value.converter": "io.confluent.connect.avro.AvroConverter",
  "value.converter.schema.registry.url": "http://schema-registry:8081"
}
```

## Configuring the JDBC Sink Connector

To configure the JDBC Sink connector, you can use the [create-sink-connector.http](create-sink-connector.http) file.
