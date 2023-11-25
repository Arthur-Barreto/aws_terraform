resource "tls_private_key" "ssh_key_pair" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "aws_key_pair" "deployer_key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.ssh_key_pair.public_key_openssh
}

resource "null_resource" "save_private_key" {
  triggers = {
    key_name = aws_key_pair.deployer_key_pair.key_name
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo '${tls_private_key.ssh_key_pair.private_key_pem}' > ${var.key_name}.pem
      chmod 400 ${var.key_name}.pem
    EOT
  }
}
