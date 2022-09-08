resource "google_bigquery_dataset_iam_binding" "reader" {
  project = var.project
  for_each = var.sec-policies
  
  dataset_id = each.value.dataset
  role       = each.value.role
  members    = each.value.members
}

//resource "google_bigquery_dataset" "dataset" {
//  dataset_id = var.dataset
//}