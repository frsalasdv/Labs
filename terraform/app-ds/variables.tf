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

variable "bucket_names" { 
      description = "Unique bucket names." 
      type         = list(string)
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
      type         = string
}



variable "tags" { 
      description = "tags" 
      type        = map(string)
}

variable "cmek_key" { 
      type        = string 
      description = "cmek_key"
}

variable "retention_policy_rules" { 
      description = "Retention policy rules"
      type        = list
}