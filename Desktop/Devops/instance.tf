provider "aws" {
  region = "us-east-1" 
}
resource "aws_instance" "myec2" {
    ami = "ami-09a9858973b288bdd"
    instance_type = "t2.micro"
    key_name = "teraaform-1"
    tags = {
      Name = "spiderinstance"
    }
}