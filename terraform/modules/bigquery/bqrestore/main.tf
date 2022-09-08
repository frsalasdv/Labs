

resource "null_resource" "python_exec" {
  triggers = {
    always_run = "${timestamp()}"
  }
    #  for_each
  provisioner "local-exec" {
      command = "python3.6  ../inputbq/scripts/bigquery_restore.py --input gs://hsbc-11338506-fdsmx-dev-tfstate-1/backup/pbdtesmul2gcp/acciones_bitacora --output pbdtesmul2gcp"
  }
}


