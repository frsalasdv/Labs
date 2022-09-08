data "google_dns_managed_zone" "env_dns_zone" {
  name = var.managed_zone
}

resource "google_dns_record_set" "dns" {
  name = "ctrlm.${data.google_dns_managed_zone.env_dns_zone.dns_name}"
  type = "A"
  ttl = 300

  managed_zone = data.google_dns_managed_zone.env_dns_zone.name

  rrdatas = var.network_ips
}

