resource "oci_streaming_stream" "this" {
  compartment_id     = var.stream_pool_id == null ? var.compartment_id : null
  name               = var.name
  partitions         = var.partitions
  stream_pool_id     = var.stream_pool_id
  retention_in_hours = var.retention_in_hours

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags
}
