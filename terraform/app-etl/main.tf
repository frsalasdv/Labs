#data "google_secret_manager_secret_version" "engine-secret" { 
# project = var.project 
# provider = google-beta 
# secret = "engine-secret-${var.environment}"
#}

module "compute-instance" { 
source                 = "../modules/compute/gce" 
project                = var.project 
region                 = var.region 
namespace              = "gcs" 
name                   = var.instance_name 
environment            = "dev" 
vm_image_family        = var.vm_image_family 
disk_type              = var.disk_type 
machine_type           = var.machine_type 
subnetwork             = var.subnetwork 
network                = var.network 
service_account_email  = var.service_account
tags                   = []
service_account_scopes = var.service_account_scopes 
disk_labels            = var.disk_labels 
labels                 = var.labels 

}

