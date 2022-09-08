variable "project" {
  description = "Project ID"
  type        = string
}

variable "sec-policies" {
  type = map(object({ 
     members       = list(string) 
     role          = string
     dataset       = string
  }))
}