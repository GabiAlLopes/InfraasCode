variable "amis" {
  type        = map

  default = {
      "sa-east-1" = "ami-01599cb8b5d301336"
      "us-east-2" = "ami-0443305dabd4be2bc"
  }
}

variable "cdirsacessoremoto"{
    type = list
    default = ["200.158.90.215/32","200.158.90.215/32"]
}

variable "key_name"{
    default = "terraform-aws"
}
