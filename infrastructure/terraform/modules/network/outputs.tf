output "vpc_arn" {
  value = aws_vpc.vpc.arn
}
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnets" {
  value = aws_subnet.public-subnet.*.id
}

output "private_subnets" {
  value = aws_subnet.private-subnet.*.id
}