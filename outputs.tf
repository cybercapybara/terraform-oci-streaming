output "id" {
  description = "OCID of the stream."
  value       = oci_streaming_stream.this.id
}

output "name" {
  description = "Name of the stream."
  value       = oci_streaming_stream.this.name
}

output "messages_endpoint" {
  description = "Endpoint used to produce to and consume from the stream."
  value       = oci_streaming_stream.this.messages_endpoint
}

output "stream_pool_id" {
  description = "OCID of the stream pool the stream belongs to."
  value       = oci_streaming_stream.this.stream_pool_id
}

output "state" {
  description = "Lifecycle state of the stream."
  value       = oci_streaming_stream.this.state
}
