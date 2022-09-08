variable "project" {
  description = "Project ID"
  type        = string
}


variable "sec-policies_buckets1" {
  type = map(object({ 
     members_names       = list(string) 
     role_name           = string
  }))
} 

variable "sec-policies_buckets2" {
  type = map(object({ 
    bucket_name          = string
  }))
}