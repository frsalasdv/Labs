variable "project" {
  description = "Project ID"
  type        = string
}

variable "sec-policies-for-tables-views" {
  type = map(object({ 
     members       = list(string) 
     role          = string
     dataset       = string
     table         = string
  }))
}