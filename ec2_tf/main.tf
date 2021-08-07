#Configurando o Provedor
provider "aws" {
  version = "~> 2.0"
  region = "sa-east-1"
}

#Criacao de security group
resource "aws_security_group" "acesso_ssh" {
  name = "allow_tls"
  description = "Allow tls inbound traffic"

  ingress {
    #TLS (change to whatever ports you need)
    from_port = 22
    to_port = 22
    protocol = "tcp"
    # Please restrict your ingress to only necessary IPs and ports
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["200.158.90.215/32"]
  }

  tags = {
    Name = "ssh"
  }
}

#Configurando 3 instancias
resource "aws_instance" "dev" {
  count = 3
  ami = "ami-01599cb8b5d301336"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "instance-${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}