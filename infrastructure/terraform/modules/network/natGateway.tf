# Create a NAT gateway with an Elastic IP for each private subnet to get internet connectivity
resource "aws_eip" "elastic-ip" {
  count      = length(var.availability_zones)
  vpc        = true
  depends_on = [aws_internet_gateway.internet-gateway]
}

resource "aws_nat_gateway" "nat-gateway" {
  count         = length(var.availability_zones)
  subnet_id     = element(aws_subnet.public-subnet.*.id, count.index)
  allocation_id = element(aws_eip.elastic-ip.*.id, count.index)
}
