variable "amis" {
  type = map(string)

  default = {
    "us-east-1" = "ami-09e67e426f25ce0d7"
    "us-east-2" = "ami-074cce78125f09d61"
  }

}

variable "cdirs_acesso_remoto" {
  type = list(string)

  default = ["189.6.118.158/32"]

}

variable "key_name" {
    type = string
    default = "terraform-aws"
}

variable "instance_type" {
    default = "t2.micro"
}