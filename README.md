# terraform-oci-streaming

Terraform module that manages an [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/)
Streaming stream, a Kafka-compatible, partitioned, append-only log for event ingestion.
The stream can live in the default pool for a compartment or in an explicit stream pool.

## Usage

```hcl
module "stream" {
  source = "github.com/moveeeax/terraform-oci-streaming"

  compartment_id     = var.compartment_id
  name               = "prod-events"
  partitions         = 3
  retention_in_hours = 48

  freeform_tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| oci       | >= 5.0   |

## Inputs

| Name                 | Description                                                       | Type          | Default | Required |
|----------------------|-------------------------------------------------------------------|---------------|---------|:--------:|
| `compartment_id`     | OCID of the compartment in which to create the stream.            | `string`      | n/a     |   yes    |
| `name`               | Name of the stream.                                               | `string`      | n/a     |   yes    |
| `partitions`         | Number of partitions in the stream.                              | `number`      | `1`     |    no    |
| `stream_pool_id`     | Stream pool OCID to place the stream in. Null uses default pool.  | `string`      | `null`  |    no    |
| `retention_in_hours` | Retention period in hours (24-168).                              | `number`      | `24`    |    no    |
| `freeform_tags`      | Free-form tags applied to the stream.                            | `map(string)` | `{}`    |    no    |
| `defined_tags`       | Defined tags applied to the stream, keyed `namespace.key`.       | `map(string)` | `{}`    |    no    |

## Outputs

| Name                | Description                                        |
|---------------------|----------------------------------------------------|
| `id`                | OCID of the stream.                                |
| `name`              | Name of the stream.                                |
| `messages_endpoint` | Endpoint to produce to and consume from the stream.|
| `stream_pool_id`    | OCID of the stream pool the stream belongs to.     |
| `state`             | Lifecycle state of the stream.                     |

## License

[MIT](LICENSE)
