variable "notificacion_channel" {
  type = map(object({
    display_name = string
    type         = string
    username     = string
    url          = string
    password     = string
  }))
}