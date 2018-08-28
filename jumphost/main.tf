resource "aws_instance" "jump" {
  ami           = "ami-6cd6f714"
  instance_type = "t2.micro"
#  name = "jump-i"
}

resource "aws_security_group" "jump" {
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
