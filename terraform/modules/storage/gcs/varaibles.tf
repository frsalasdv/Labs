variable "project" {
  description = "project where bucket needs to be created"
  type        = string
}

variable "bucket_names" {
  description = "Unique bucket names"
  type        = list(string)
}

variable "storage_class" {
  description = "Storage class"
  type        = string
  default     = "MULTI_REGIONAL"
}

variable "force_destroy" {
  description = "Force te destroy of the bucket even this not be empty."
  type        = bool
  default     = false
}

variable "bucket_location" {
  description = "Locaton where the bucket will be created."
  type        = string
  default     = "US"
}

variable "bucket_policy" {
  description = "Bucket policy to be used on the uniform_bucket_level_access attribute."
  type        = string
  default     = false
}

variable "versioning" {
  description = "Bucket versioning."
  type        = bool
  default     = true
}

variable "lifecycle_rules" {
  description = "life cycle rules"
  type        = list
  default     = []
}

variable "retention_policy_rules" {
  description = "Retention policy rules"
  type        = list
  default     = []
}

variable "labels" {
  description = "labels"
  type        = map(string)
  default     = {}
}

variable "bucket_versioning" {
  description = "Bucket versioning"
  type        = bool
  default     = true
}

variable "cmek_key" {
  type        = string
  description = "bucket cmek_key"
}