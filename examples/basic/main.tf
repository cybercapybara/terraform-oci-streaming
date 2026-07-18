provider "oci" {}

module "stream" {
  source = "../.."

  compartment_id     = var.compartment_id
  name               = "example-stream"
  partitions         = 1
  retention_in_hours = 24

  freeform_tags = {
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}

variable "compartment_id" {
  description = "Compartment OCID to deploy the example stream into."
  type        = string
}

output "stream_id" {
  value = module.stream.id
}
