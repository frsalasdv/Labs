#data "google_secret_manager_secret_version" "dataset-secret" { 
#  project  = var.project 
#  provider = google-beta 
#  secret   = "dataset-secret-${var.environment}"

module "big_query" { 
        source            = "../modules/bigquery/dataset"
        datasets_id       =  var.datasets_id 
        region            =  var.region 
        tags              =  var.labels 
        kms_key_self_link =  var.kms_key_self_link # data.google_secret_manager_secret_version.dataset-secret.secret_data
}