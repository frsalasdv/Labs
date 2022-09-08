locals {
  //kms_key_self_link  = var.hsm_enable ? format("projects/%s/locations/%s/keyRings/computeEngine/cryptoKeys/HSMcomputeEngine", var.kms_project, var.region) : format("projects/%s/locations/%s/keyRings/computeEngine/cryptoKeys/computeEngine", var.kms_project, var.region)
  metadata = var.metadata == null ? tomap({"disable-legacy-endpoints" = true}) : merge(var.metadata,tomap({"disable-legacy-endpoints" = true}) )
}

module "instance_label" {
  source      = "../gce-labels"
  namespace   = var.namespace
  environment = var.environment
  name        = var.name
  attributes  = var.attributes
  delimiter   = "-"
  labels      = var.labels
}



resource "google_compute_instance" "vm_instance" {
  project                   = var.project
  name                      = "gce-${var.project}-${var.region}-${var.name}"
  machine_type              = var.machine_type
  zone                      = var.zone
  tags                      = var.tags
  metadata                  = local.metadata
  allow_stopping_for_update = var.allow_stopping_for_update
  can_ip_forward            = false
  desired_status            = var.desired_status
  deletion_protection       = var.deletion_protection   #default
  
  boot_disk {
    auto_delete       = var.disk_auto_delete
    
    initialize_params {
      size    = var.disk_size
      type    = var.disk_type
      image   = var.vm_image_family
      labels  = var.disk_labels
    }
  }

  service_account {
    email  = var.service_account_email  #(Optional) The service account e-mail address
    scopes = var.service_account_scopes #(Required) A list of service scopes To allow full access to all Cloud APIs, use the "cloud-platform"
  }

 	network_interface {
		network             = var.network    
		subnetwork          = var.subnetwork 
	}

  scheduling {
    automatic_restart   = var.automatic_restart
    on_host_maintenance = var.on_host_maintenance
    preemptible         = false          #default
  }

  labels = module.instance_label.labels
}



