
variable "namespace" {
  description = "Namespace, which could be your organization name, e.g. `gcs` or `dcs`"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment, e.g. `dev`, `innov`, or `prod`"
  type        = string
}

variable "name" {
  description = "Solution name, e.g. `app`"
  type        = string
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `name`, `environment` and `attributes`"
}

variable "attributes" {
  type        = list
  default     = []
  description = "Additional attributes, e.g. `1`"
}

variable "labels" {
  type        = map
  default     = {}
  description = "Additional labels (e.g. `map(`BusinessUnit`,`XYZ`)"
}

variable "convert_case" {
  description = "Convert fields to lower case"
  default     = true
}
