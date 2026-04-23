provider "aws" {
  region = "us-east-1"
}

variable "instances" {
  type = list(object({
    name          = string
    ami           = string
    instance_type = string
    subnet_id     = string
    tags          = map(string)
  }))
}

resource "aws_instance" "ec2" {
  for_each = { for inst in var.instances : inst.name => inst }

  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = each.value.subnet_id

  tags = merge(each.value.tags, {
    Name = each.value.name
  })
}