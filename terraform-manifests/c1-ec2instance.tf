
resource "aws_instance" "my_ec2" {
  ami = "ami-0960ab670c8bb45f3"
  tags = {
    "Name" = "MyEC2"
    "product" = "admin"
    "owner" = "Jerico"
  }
}