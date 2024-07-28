resource "aws_launch_template" "frontend_launch_template" {
  name = "template"

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 10
      volume_type = "gp3"
    }
  }

  network_interfaces {
    subnet_id                   = aws_subnet.frontend_subnet.id
    associate_public_ip_address = false
    security_groups             = [aws_security_group.frontend_security_group.id]
  }

  key_name      = "DevInfraAditya"
  
  image_id      = "ami-0dd996798fdc2fe23"
 
  instance_type = "t2.micro"

  network_interfaces {
    associate_public_ip_address = false
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "launch_template"
    }
  }
}
