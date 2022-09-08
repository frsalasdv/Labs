

module "notificacion_channel" {
    source               = "../modules/security/gcp_notification_channel/"
    notificacion_channel =  var.notificacion_channel

}

