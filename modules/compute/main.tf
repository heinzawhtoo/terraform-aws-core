resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  user_data = <<-EOT
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl enable httpd
    systemctl start httpd
    echo "<h1>${var.name_prefix} web server</h1>" > /var/www/html/index.html
  EOT

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-web"
  })
}
