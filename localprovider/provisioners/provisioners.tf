resource "null_resource" "local" {
  provisioner "local-exec" {
    command = "Get-Process > process.txt"
    interpreter = ["powershell", "-Command"]
  }
}