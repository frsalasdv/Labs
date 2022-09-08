




locals {
  original_tags = join(
    var.delimiter,
    compact(flatten([[var.namespace, var.name, var.environment], var.attributes]))
  )
}

locals {
  transformed_tags = var.convert_case ? lower(local.original_tags) : local.original_tags
}

locals {
  id = var.enabled ? local.transformed_tags : ""

  name        = var.enabled && var.convert_case ? lower(format("%v", var.name)) : format("%v", var.name) 
  delimiter   = var.enabled && var.convert_case ? lower(format("%v", var.delimiter)) : format("%v", var.delimiter) 
  namespace   = var.enabled && var.convert_case ? lower(format("%v", var.namespace)) : format("%v", var.namespace) 
  environment = var.enabled && var.convert_case ? lower(format("%v", var.environment)) : format("%v", var.environment) 
  attributes  = var.enabled && var.convert_case ? lower(format("%v", join(var.delimiter, flatten(var.attributes)))) : format("%v", join(var.delimiter, flatten(var.attributes))) 

  # Merge input tags with our tags.
  labels = merge(
    {
      "namespace"   = local.namespace
      "environment" = local.environment
    },
    var.labels,
  )
}
