variable "compartment_id" {
  description = "OCID of the compartment in which to create the stream."
  type        = string
}

variable "name" {
  description = "Name of the stream."
  type        = string
}

variable "partitions" {
  description = "Number of partitions in the stream."
  type        = number
  default     = 1

  validation {
    condition     = var.partitions >= 1
    error_message = "partitions must be at least 1."
  }
}

variable "stream_pool_id" {
  description = "OCID of an existing stream pool to place the stream in. Null uses the default pool."
  type        = string
  default     = null
}

variable "retention_in_hours" {
  description = "Retention period of the stream in hours (24 to 168)."
  type        = number
  default     = 24

  validation {
    condition     = var.retention_in_hours >= 24 && var.retention_in_hours <= 168
    error_message = "retention_in_hours must be between 24 and 168."
  }
}

variable "freeform_tags" {
  description = "Free-form tags applied to the stream."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags applied to the stream, keyed as \"namespace.key\"."
  type        = map(string)
  default     = {}
}
