
variable "project" {
  type        = string
  description = "The project for which resources alert policy is set"
}

variable "zone" {
  description = "zone where the infrastructure is deployed."
  type        = string
}

variable "region" {
  description = "Region where the infrastructure is deployed."
  type        = string
}

variable "notificacion_channel" {
  type = map(object({
    display_name = string
    type         = string
    username     = string
    url          = string
    password     = string
  }))
}