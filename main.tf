
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.10.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}


resource "aws_instance" "web" {
     instance_type = "t2.micro"
     ami = "ami-03d5c68bab01f3496"
     availability_zone = "us-west-2a"
     count = 1
     key_name = "appkey"
     subnet_id = "subnet-098a1010ccc77c185"
     associate_public_ip_address = "true"
     vpc_security_group_ids = ["sg-0ffb4eac11af26e6e"]
     tags = {
       Name = "instance-$count.index"
     }

     provisioner "remote-exec" {
     inline = ["git clone https://github.com/rcorales/handy-tools.git",
               "cd handy-tools",
               "chmod +x nginx.sh",
               "./nginx.sh",
               ]
     }
 
     connection {
     type = "ssh"
     user = "ubuntu"
     host = self.public_ip
     private_key = "${file("appkey.pem")}"
     }
}

output "public_ip" {
     value = aws_instance.web.*.public_ip
}