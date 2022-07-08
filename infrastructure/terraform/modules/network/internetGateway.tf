# Internet Gateway for the public subnet
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id
}