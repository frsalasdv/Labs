#data "google_secret_manager_secret_version" "bucket-secret" { 
#  project  = var.project #  provider = google-beta 
#  secret   = "bucket-secret-${var.environment
#}"

module buckets { 
  source = "../modules/storage/gcs" 
  project                 = var.project
  bucket_names            = var.bucket_names
  storage_class           = var.storage_class 
  bucket_location         = var.location
  force_destroy           = var.force_destroy 
  bucket_versioning       = var.versioning
  bucket_policy           = var.bucket_policy
  cmek_key                = var.cmek_key 
  labels                  = var.labels
  lifecycle_rules         = var.lifecycle_rules 
  retention_policy_rules  = var.retention_policy_rules
}
