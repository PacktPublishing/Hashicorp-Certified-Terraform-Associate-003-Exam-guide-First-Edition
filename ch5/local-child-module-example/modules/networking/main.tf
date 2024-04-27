### CODE FOR THE VPC ###
resource "aws_vpc" "child_module_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

### CODE FOR THE SUBNET CREATION ###
resource "aws_subnet" "child_module_subnet" {
  vpc_id            = aws_vpc.child_module_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.az
  tags = {
    Name = var.subnet_name
  }
}

### CODE FOR THE INTERNET GATEWAY ###
resource "aws_internet_gateway" "child_module_igw" {
  vpc_id = aws_vpc.child_module_vpc.id
  tags = {
    Name = "child-internet-gateway"
  }
}

### CODE FOR THE ROUTE TABLE ###
resource "aws_route_table" "child_module_rt" {
  vpc_id = aws_vpc.child_module_vpc.id

  tags = {
    Name = "child-route-table"
  }
}

### CODE FOR THE ROUTES ###
resource "aws_route" "child_module_rt_routes" {
  route_table_id         = aws_route_table.child_module_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.child_module_igw.id
}

### CODE FOR ASSOCIATING THE SUBNETS TO THE ROUTE TABLE ###
resource "aws_route_table_association" "child_module_subnet_association" {
  subnet_id      = aws_subnet.child_module_subnet.id
  route_table_id = aws_route_table.child_module_rt.id
}