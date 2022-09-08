

variable "enable" {
  type        = bool
  description = "Enables the resource creation."
  default     = true
}

variable "project" {
  type        = string
  description = "The project to deploy to, if not set the default provider project is used."
}

variable "region" {
  type        = string
  description = "Region for cloud resources."
}

variable "zone" {
  type        = string
  description = "Zone for instance."
  default     = null
}

variable "name" {
  type        = string
  description = "Solution name, e.g. `app`"
}

variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name, bussiness line, POD; e.g. `gcs` or `dcs`"
}

variable "attributes" {
  type        = list(string)
  description = "Additional attributes, e.g. `1`"
  default     = []
}

variable "convert_case" {
  type        = bool
  description = "Convert fields to lower case for resources naming convention."
  default     = true
}

variable "delimiter" {
  type        = string
  description = "Delimiter to be used between `namespace`, `name`, `environment` and `attributes`"
  default     = "-"
}

variable "environment" {
  type        = string
  description = "Environment, e.g. `dev`, `innov` or `prod`"
}

variable "metadata" {
  type        = map(string)
  description = "Map of metadata values to pass to instances."
  default     = null
}



variable "labels" {
  description = "Labels added to instances."
  type        = map(string)
  default     = {}
}

variable "disk_labels" {
  description = "Labels added to instances."
  type        = map(string)
  default     = {}
}


variable "machine_type" {
  description = "machine type for the instance"
  type        = string
  default     = "f1-micro"
}

variable "tags" {
  description = "Tag added to instances for firewall and networking."
  type        = list(string)
}

variable "vm_image_family" {
  type        = string
  description = "path to hsbc approved disk image family"
  default     = "projects/hsbc-6320774-distcompute-prod/global/images/family/gce-imagefamily-type3-rhel7-stage2"
}

variable "disk_type" {
  type        = string
  description = "compute disk type"
  default     = "pd-ssd"
}

variable "disk_size" {
  description = "size of compute disk"
  type        = number
  default     = null
}

variable "disk_auto_delete" {
  description = "auto delete disk"
  type        = bool
  default     = true
}



variable "service_account_email" {
  type        = string
  description = "service account to be used for compute"
  default     = null
}

variable "service_account_key"{
  type        = string
  description = "service account key to be used for compute"
  default     = null
} 

variable "allow_stopping_for_update"{
  type        = bool
  description = "Allow stopping for update"
  default     = true
}

variable "desired_status"{
  type        = string
  description ="Desired status of the instance either RUNNING or TERMINATED"
  default     = "RUNNING"
}

variable "deletion_protection"{
  type        = bool
  description = "Enables the deletion protection."
  default     = false
}

variable "automatic_restart"{
  type        = bool
  description = "Enables the automatic restart."
  default     =  true
}

variable "on_host_maintenance"{
  type        = string
  description = "Describes maintenance behavior for the instance either can be MIGRATE or TERMINATE"
  default     = "MIGRATE"
}

variable "preemptible"{
  type        = bool
  description = "Enables the preemptible."
  default     = false
}

variable "service_account_scopes" {
  description = "List of scopes for the instance template service account"
  type        = list(string)
}

variable "startup_script" {
  description = "path to start-up script"
  type        = string
  default     = ""
}

variable "static_ip" {
  description = "static ip"
  type        = string
  default     = ""
}

variable "subnetwork" {
  description = "subnetwork info"
  type        = string
}

variable "network" {
  description = "network info"
  type        = string
}

