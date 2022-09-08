variable "project" {
  description = "project where bucket needs to be created"
  type        = string
}

variable "region" {
  description = "Region where the infrastructure is deployed."
  type        = string
}

variable "zone" {
  description = "zone where the infrastructure is deployed."
  type        = string
}

variable "environment" {
  description = "environment where the infrastructure is deployed."
  type        = string
}

variable "backend_bucket_name" {
  description = "Unique bucket name."
  type        = list(string)
}

variable "storage_class" {
  description = "Storage class"
  type        = string
}

variable "force_destroy" {
  description = "Force te destroy of the bucket even this not be empty."
  type        = bool
}

variable "location" {
  description = "Locaton where the bucket will be created."
  type        = string
}

variable "bucket_policy" {
  description = "Bucket policy to be used on the uniform_bucket_level_access attribute."
  type        = string
}

variable "versioning" {
  description = "Bucket versioning."
  type        = bool
}

variable "lifecycle_rules" {
  description = "life cycle rules"
  type        = list
}

variable "labels" {
  description = "labels"
  type        = map(string)
}

variable "cmek_key" {
  type        = string
  description = "cmek_key"
}