resource "google_monitoring_notification_channel" "AlertAPi" {
  for_each = var.notificacion_channel

  display_name  = each.value.display_name
  type = each.value.type
  
  labels = {
    "username" = each.value.username
    "url" = each.value.url
  }
  sensitive_labels {  
	password   = each.value.password
  }
}