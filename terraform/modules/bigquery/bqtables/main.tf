

# This resource will destroy (potentially immediately) after null_resource.next
resource "null_resource" "previous" {}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "10s"
}

resource "null_resource" "python_exec" {
  depends_on = [time_sleep.wait_30_seconds] 
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
      command = "python3.6  ../inputbq/scripts/bqcreation.py  -e ${var.environment} -r datafiles"
  }
}
