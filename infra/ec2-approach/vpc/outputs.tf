output "vpc_id" {
  value = aws_vpc.custom_vpc.id
}

output "route_table_id" {
  value = aws_route_table.route_table.id
}
