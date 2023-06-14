resource "aws_instance" "web" {
  ami                         = "ami-08df646e18b182346"
  instance_type               = "t2.micro"
  key_name                    = "mykeypair"
  subnet_id                   = aws_subnet.public[count.index].id
  vpc_security_group_ids      = [aws_security_group.alb_sg.id]
  associate_public_ip_address = true
  count                       = var.ec2_count
  user_data                   = <<-EOF

       #!/bin/bash
       sudo su
       yum update -y
       yum install httpd -y
       systemctl start httpd 
       systemctl enable httpd

    EOF

  tags = {
    Name = "Web-instance-${count.index}"
  }

  #Place demo html file inside instance
  provisioner "file" {
    source      = "./index.html"
    destination = "/var/www/html/index.html"
  }

  #Give execution permission to HTML file
  provisioner "remote-exec" {
    inline = [
      "chmod +x /var/www/html/index.html"
    ]
  }
  /*
 //We can place the generated tfstate backup file at host's temp folder and also let it handled through gitignore  
 provisioner "file" {
    source      = "terraform.tfstate.backup"
    destination = "/tmp/"
  } 
*/
}

