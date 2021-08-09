#Configurando o Provedor
provider "aws" {
  region = "sa-east-1"
}

provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"
}


#Configurando 3 instancias
resource "aws_instance" "dev" {
  count = 3
  ami = "${var.amis["sa-east-1"]}"
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    Name = "instance-${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
}

#Configurando 1 instancia
resource "aws_instance" "instance-4" {
  ami = "${var.amis["sa-east-1"]}"
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    Name = "instance-4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
  depends_on = [aws_s3_bucket.instance-4]
}

resource "aws_instance" "instance-5" {
  ami = "${var.amis["sa-east-1"]}"
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    Name = "instance-5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
}

resource "aws_instance" "instance-6" {
  provider = aws.us-east-2
  ami = "${var.amis["us-east-2"]}"
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    Name = "instance-6"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh_us_east_2.id}"]
  depends_on = [aws_dynamodb_table.dynamodb-homologacao]
}


resource "aws_instance" "instance-7" {
  provider = aws.us-east-2
  ami = "${var.amis["us-east-2"]}"
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    Name = "instance-7"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh_us_east_2.id}"]
  depends_on = [aws_dynamodb_table.dynamodb-homologacao]
}


resource "aws_s3_bucket" "instance-4" {
  bucket = "alura-teste-tf-s3"
  acl    = "private"

  tags = {
    Name        = "alura-teste-tf-s3"
  }
}

resource "aws_s3_bucket" "homologacao" {
  bucket = "alura-teste-homologacao"
  acl    = "private"

  tags = {
    Name        = "alura-teste-homologacao"
  }
}
