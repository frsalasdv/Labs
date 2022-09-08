resource "google_monitoring_alert_policy" "default" {
  project               = var.project
  notification_channels = var.notification_channels
  combiner              = var.combiner

  for_each = var.policies

  enabled      = each.value.enabled
  display_name = each.value.display_name
  
  conditions {
    display_name = each.value.condition_name
    condition_threshold {
      filter          = each.value.filter
      duration        = each.value.duration
      comparison      = each.value.comparison
      threshold_value = each.value.threshold_value
      aggregations {
        alignment_period     = each.value.alignment_period
        per_series_aligner   = each.value.per_series_aligner
        cross_series_reducer = each.value.cross_series_reducer
      }
      trigger {
        count = each.value.count
      }
    }
  }

  
  documentation {
    content = each.value.content
  }
  user_labels = merge(var.user_labels, {
    metric_id = lower(lookup(var.logging_metrics_ids, each.key, ""))
  })
}