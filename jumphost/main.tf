provider "aws" { 

 region = "us-east-1"
 access_key = ""
 secret_key = ""
}

resource "aws_instance" "jump-1" {

  ami           = "ami-04681a1dbd79675a5"
  instance_type = "t2.micro"
}

resource "aws_security_group" "jump-1" {
  name = "jump-sg"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/21"]
  }

  egress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/21"]
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.jump-1.id}"
}

resource "aws_instance" "jump-3" {

  ami           = "ami-04681a1dbd79675a5"
  instance_type = "t2.micro"
}

resource "aws_security_group" "jump-3" {
  name = "jump-2-sg"
#  security_group_id = "${aws_security_group.jump.id}"
}


