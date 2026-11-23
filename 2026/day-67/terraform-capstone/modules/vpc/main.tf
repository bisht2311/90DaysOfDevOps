resource "aws_vpc" "vpc" {
  cidr_block       = var.cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
    Project = var.project_name
    Environment = var.environment
    ManagedBy = "Terraform"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-${var.environment}-public_subnet"
    Project = var.project_name
    Environment = var.environment
    ManagedBy = "Terraform"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-${var.environment}-igw"
    Project = var.project_name
    Environment = var.environment
    ManagedBy = "Terraform"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-rt"
    Project = var.project_name
    Environment = var.environment
    ManagedBy = "Terraform"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rt.id  
}
