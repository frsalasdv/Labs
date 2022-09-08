#The below resource creates google storage bucket with the respective fileds given by applications that invokes it

resource "google_storage_bucket" "gcs_bucket" {	
  count            			      	= length(var.bucket_names)
  project         			      	= var.project 
  name              			      = var.bucket_names[count.index]
  storage_class      			      = var.storage_class
  force_destroy     			      = var.force_destroy
  location           			      = var.bucket_location
  uniform_bucket_level_access 	= var.bucket_policy
  
  dynamic "lifecycle_rule" {
    for_each = [for rule in var.lifecycle_rules : {
      action_type                     	= rule.action.type
      action_storage_class            	= lookup(rule.action, "storage_class", null)
      condition_age                   	= lookup(rule.condition, "age", null)
      condition_created_before        	= lookup(rule.condition, "created_before", null)
      condition_with_state            	= lookup(rule.condition, "with_state", null)
      condition_matches_storage_class 	= lookup(rule.condition, "matches_storage_class", null)
    }]
    content {
      action {
        type          					= lifecycle_rule.value.action_type
        storage_class 					= lifecycle_rule.value.action_storage_class
      }
      condition {
        age                   			= lifecycle_rule.value.condition_age
        with_state            			= lifecycle_rule.value.condition_with_state
        matches_storage_class 			= lifecycle_rule.value.condition_matches_storage_class
      }
    }
  }

  dynamic "retention_policy" { #(Optional)
    for_each = var.retention_policy_rules
    content {
      is_locked        					= lookup(retention_policy.value, "is_locked", true)
      retention_period 					= lookup(retention_policy.value, "retention_period", null)
    }
  }

  encryption {
    default_kms_key_name 				= var.cmek_key
  }

  versioning {
    enabled 							= var.bucket_versioning
  }

  labels = var.labels
}