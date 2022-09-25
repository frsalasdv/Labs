
resource "google_bigquery_dataset" "bigqry_fidw" {
  count        	= length(var.datasets_id)
  dataset_id    = var.datasets_id[count.index]
  friendly_name = var.datasets_id[count.index]
  description   = var.datasets_id[count.index]
  location      = var.region
  labels        = var.tags
  
 
}