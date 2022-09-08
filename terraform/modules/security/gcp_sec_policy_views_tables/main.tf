resource "google_bigquery_table_iam_binding" "binding" {
  project = var.project
  for_each = var.sec-policies-for-tables-views

  dataset_id = each.value.dataset
  table_id = each.value.table
  role = each.value.role
  members =  each.value.members
}