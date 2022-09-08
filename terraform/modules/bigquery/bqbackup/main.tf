resource "null_resource" "python_exec" {
  triggers = {
    always_run = "${timestamp()}"
  }
  #  for_each
  provisioner "local-exec" {
      command = "python3.6  ../inputbq/scripts/bigquery_backup.py --input pbdtesmul2gcp.acciones_bitacora --output gs://hsbc-245009-fidwmxpre-prod-terraform-backends/backup"
  }
}
