# Create the same number of private subnets, each in a different AZ
resource "aws_subnet" "private-subnet" {
  count             = length(var.availability_zones)
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index)
  availability_zone = var.availability_zones[count.index]
  vpc_id            = aws_vpc.vpc.id
}

# Create var.az_count public subnets, each in a different AZ
resource "aws_subnet" "public-subnet" {
  count                   = length(var.availability_zones)
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, length(var.availability_zones) + count.index)
  availability_zone       = var.availability_zones[count.index]
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
}