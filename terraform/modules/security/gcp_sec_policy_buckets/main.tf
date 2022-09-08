data "google_iam_policy" "admin" {
  for_each = var.sec-policies_buckets1
  binding {
    role = each.value.role_name
    members = each.value.members_names
  }
}

 resource "google_storage_bucket_iam_policy" "policy" {
  for_each = var.sec-policies_buckets2
  bucket = each.value.bucket_name
  policy_data = data.google_iam_policy.admin[each.key].policy_data
 }