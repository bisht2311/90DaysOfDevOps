#DATA SOURCE - To get the Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2_gp3" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

#DATA SOURCE - To get available zones
data "aws_availability_zones" "available" {
  state = "available"
}

#LOCAL VARIABLES
locals {
  name_prefix = "${var.project_name}-${var.environment}"
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

#VPC
resource "aws_vpc" "my-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-vpc"
  })
}

#SUBNET
resource "aws_subnet" "my-public-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = var.subnet_cidr

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-subnet"
  })
}

#INTERNET GATEWAY
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-igw"
  })
}

#ROUTE TABLE
resource "aws_route_table" "my-public-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-rt"
  })
}

#ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "my-public-rta" {
  subnet_id      = aws_subnet.my-public-subnet.id
  route_table_id = aws_route_table.my-public-rt.id
}

#SECURITY GROUP and RULES
resource "aws_security_group" "my-sg" {
  name        = "${local.name_prefix}-sg"
  description = "Allow SSH, HTTP, HTTPS and all Outbound"
  vpc_id      = aws_vpc.my-vpc.id

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-sg"
  })
}

#KEY PAIR
resource "aws_key_pair" "my-kp" {
  key_name   = "${local.name_prefix}-key"
  public_key = file("terraweek-server-key.pub")
}

#EC2 INSTANCE
resource "aws_instance" "my-instance" {
  ami           = data.aws_ami.amazon_linux_2_gp3.id
  instance_type = var.instance_type
  #instance_type               = var.environment == "dev" ? "t2.micro" : "t2.small"
  key_name                    = aws_key_pair.my-kp.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.my-public-subnet.id
  vpc_security_group_ids      = [aws_security_group.my-sg.id]

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-ec2-instance"
  })

  lifecycle {
    create_before_destroy = true
  }
}