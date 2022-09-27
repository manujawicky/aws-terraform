resource "aws_instance" "linux" {
  
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "cloud-labs-NV"
  subnet_id = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.MyWebServerSeqGrp.id]
  depends_on = [aws_internet_gateway.gateway]

  tags = {
    "Name" = "Linux"
  }
}

resource "aws_vpc" "MyVpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    "Name" = "myvpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.MyVpc.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.MyVpc.id
}

resource "aws_s3_bucket" "bucket" {
  bucket = "aws-cloud-test-ami-bucket"

}


