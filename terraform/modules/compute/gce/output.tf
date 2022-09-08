output "network_ip" {
    value = google_compute_instance.vm_instance.network_interface.0.network_ip
}

output instance_name {
  value       = google_compute_instance.vm_instance.name
}