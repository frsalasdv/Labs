variable "datasets_id" {
  description = "ID in GCP only alfanumeric strings "
  type        = list(string)
}

variable "region" {
  description = "Location US - EU - ASIA"
  type        = string
}


variable "tags" {
  description = "tags"
  type        = map(string)
}

variable "kms_key_self_link" {
  description = "kms_key_self_link."
  type        = string
}