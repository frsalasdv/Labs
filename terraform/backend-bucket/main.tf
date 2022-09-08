#data "google_secret_manager_secret_version" "backend-secret" {
#  project  = var.project
#  provider = google-beta
#  secret   = "backend-secret-${var.environment}"
#}

module backend_bucket {
  source = "../modules/storage/gcs"
  project                       = var.project
  bucket_names  			  	      = var.backend_bucket_name
  storage_class                 = var.storage_class
  bucket_location               = var.location
  force_destroy                 = var.force_destroy
  versioning                    = var.versioning
  bucket_policy                 = var.bucket_policy
  cmek_key					  	        = var.cmek_key
  labels                        = var.labels
  lifecycle_rules               = var.lifecycle_rules
}

