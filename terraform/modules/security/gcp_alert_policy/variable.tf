variable "project" {
  type        = string
  description = "The project for which resources alert policy is set"
}

variable "notification_channels" {
  type        = list(string)
  description = "The notification channels for alert"
}

variable "combiner" {
  type        = string
  description = "spcifies the conditions like OR | AND"
}

#for each loop
variable "policies" {
  type = map(object({
    display_name         = string
    condition_name       = string
    duration             = string
    filter               = string
    comparison           = string
    threshold_value      = string
    alignment_period     = string
    per_series_aligner   = string
    cross_series_reducer = string
    count                = string
    content              = string
    enabled              = string
  }))
}

variable "logging_metrics_ids" {
  type    = map(string)
  default = {}
}

variable "user_labels" {
  type    = map(string)
  default = {}
}