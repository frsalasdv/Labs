module "alert policy" { 
    source                = "../modules/security/gcp_alert_policy/ "
    project               =  var.project 
    notification_channels =  var.notification_channels 
    combiner              =  var.combiner 
    policies              =  var.policies 
    logging_metrics_ids   =  var.logging_metrics_ids
}
    