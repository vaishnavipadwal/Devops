provider "aws" {
  region = "us-east-1" 
}
resource "aws_instance" "myec2" {
    ami = "ami-01816d07b1128cd2d"
    instance_type = "t2.micro"
    key_name = "teraaform-1"
    tags = {
      Name = "spiderinstance"
    }
}