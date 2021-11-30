terraform {

}

provider "aws" {
  region = var.region
}

variable "region" {
  default = "ap-northeast-1"
}
variable "web_instance_count" {
  default = 2
}
variable "db_instance_count" {
  default = 3
}
variable "ami" {
  default = "ami-06cd52961ce9f0d85"
}

resource "aws_instance" "web" {
  ami           = var.ami
  count         = var.web_instance_count
  instance_type = "t2.micro"
  tags = {
    owner = "me",
    ttl   = "10",
    Name = "web-${count.index}"
  }
}

resource "aws_instance" "db" {
  ami           = var.ami
  count         = var.db_instance_count
  instance_type = "t2.micro"
  tags = {
    owner = "me",
    ttl   = "10",
    Name = "db-${count.index}"
  }
}