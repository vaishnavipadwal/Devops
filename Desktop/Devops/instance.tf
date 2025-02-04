provider "aws" {
  region = "us-east-1" 
}
resource "aws_instance" "myec2" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    key_name = "teraaform-1"
    tags = {
      Name = "spiderinstance"
    }
}