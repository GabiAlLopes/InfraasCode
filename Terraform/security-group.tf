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
    cidr_blocks = "${var.cdirsacessoremoto}"
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "acesso_ssh_us_east_2" {
  
  #Setando o novo provedor para a AZ nova
  provider = aws.us-east-2
  #Setando o novo provedor para a AZ nova


  name = "allow_tls"
  description = "Allow tls inbound traffic"

  ingress {
    #TLS (change to whatever ports you need)
    from_port = 22
    to_port = 22
    protocol = "tcp"
    # Please restrict your ingress to only necessary IPs and ports
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = "${var.cdirsacessoremoto}"
  }

  tags = {
    Name = "ssh"
  }
}