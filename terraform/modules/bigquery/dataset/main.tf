
resource "google_bigquery_dataset" "bigqry_fidw" {
  count        	= length(var.datasets_id)
  dataset_id    = var.datasets_id[count.index]
  friendly_name = var.datasets_id[count.index]
  description   = var.datasets_id[count.index]
  location      = var.region
  labels        = var.tags
  
  default_encryption_configuration {
      kms_key_name = var.kms_key_self_link
  }

  access {
    role          = "OWNER"
    group_by_email = "gcp.hsbc-245009-fidwmx-dev.bigquery-admin-priv@hsbc.com"
  }

}