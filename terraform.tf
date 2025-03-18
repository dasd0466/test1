provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_ec2" {
    ami = ami-077062c5cfb91a89e
    instance_type = "t2.micro"

    tags = {
        name= "Example Ec2 Instance "
    }
  
}

resource "aws_security_group" "sg" {
    name = "my-sg"

    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }
}

