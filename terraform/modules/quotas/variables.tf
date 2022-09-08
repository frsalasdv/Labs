variable "project" {
  type        = string
  description = "The project for which resources alert policy is set"
}

variable "region" {
  description = "Region where the infrastructure is deployed."
  type        = string
}

variable "zone" {
  description = "zone where the infrastructure is deployed."
  type        = string
}

#for each loop
variable "quotas" {
  type = map(object({
    service              = string
    metricgroup          = string
    metric               = string
    limit                = string
    override_value       = string
    name                 = string
  }))
}