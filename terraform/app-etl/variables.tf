variable "project" {
    description = "Project ID" 
    type = string
}

variable "machine_type" {
    description = "machine_type" 
    type = string
}
    
variable "region" {
    description = "Region where the infrastructure is deployed." 
    type= string
}

variable "zone" {
    description = "zone where the infrastructure is deployed." 
    type= string
}



variable "instance_name" {
    description = "instance_name." 
    type = string
}

variable "vm_image_family" {
    description = "vm_image_family." 
    type= string
}

variable "service_account" {
    description = "service account of the instance." 
    type = string
}

variable "service_account_scopes" {
    description = "service account sccopes of the instance." 
    type = list(string)
}

variable "labels" {
    description = "labels of the instance." 
    type = map(string)
}

variable "disk_labels" {
    description = "disk_labels."
    type = map(string)
}

variable "disk_type" {
    description = "type of the disk of the instance." 
    type = string
}


variable "subnetwork" {
    description = "subnetwork info"
     type = string
}

variable "network" {
    description = "network info" 
    type = string
}
