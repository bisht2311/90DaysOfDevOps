#VPC
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "TerraWeek-VPC"
  }
}

#SUBNET
resource "aws_subnet" "my-public-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "TerraWeek-Public-Subnet"
  }
}

#INTERNET GATEWAY
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "TerraWeek-IGW"
  }
}

#ROUTE TABLE
resource "aws_route_table" "my-public-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = {
    Name = "TerraWeek-Public-RT"
  }
}

#ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "my-public-rta" {
  subnet_id      = aws_subnet.my-public-subnet.id
  route_table_id = aws_route_table.my-public-rt.id
}

#SECURITY GROUP and RULES
resource "aws_security_group" "my-sg" {
  name        = "TerraWeek-SG"
  description = "Allow SSH, HTTP and all Outbound"
  vpc_id      = aws_vpc.my-vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "TerraWeek-SG"
  }
}

#KEY PAIR
resource "aws_key_pair" "my-kp" {
  key_name   = "terraweek-server-key"
  public_key = file("terraweek-server-key.pub")
}

#EC2 INSTANCE
resource "aws_instance" "my-instance" {
  ami                         = "ami-0f19324397f53458f" #"ami-0c7632fb77f35db43"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.my-kp.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.my-public-subnet.id
  vpc_security_group_ids      = [aws_security_group.my-sg.id]

  tags = {
    Name = "TerraWeek-Server"
  }

  lifecycle {
    create_before_destroy = true
  }
}

#S3 BUCKET
resource "aws_s3_bucket" "my-bucket" {
  bucket     = "terraweek-application-logs-bucket"
  depends_on = [aws_instance.my-instance]

  tags = {
    Name = "TerraWeek Application Logs Bucket"
  }
}
