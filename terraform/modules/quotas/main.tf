resource "google_service_usage_consumer_quota_override" "override" {
  provider              = google-beta
  project               = var.project
  force                 = true
  dimensions            = {}

  for_each = var.quotas
  
  service               = each.value.service 
  //id                    = "projects/${var.project}/services/${each.value.service}/${each.value.metricgroup}/${each.value.metric}/limits/${each.value.limit}/ConsumerOverrides/${each.value.name}"
  //id   = "projects/hsbc-11331014-rdledwgcpua-dev/services/bigquery.googleapis.com/consumerQuotaMetrics/bigquery.googleapis.com%2Fquota%2Fquery%2Fusage/limits/%2Fd%2Fproject/ConsumerOverrides/Cg1RdW90YU92ZXJyaWRl"
  metric                = each.value.metric
  limit                 = each.value.limit
  override_value        = each.value.override_value  
  //name                  = each.value.name
 }


  



