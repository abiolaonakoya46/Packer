build {
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]
  }

  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
  }

  provisioner "shell" {
    inline = [
      "sudo mv /tmp/index.html /var/www/html/index.html"
    ]
  }
}
