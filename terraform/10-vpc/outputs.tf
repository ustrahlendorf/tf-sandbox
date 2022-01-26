#output "vpc_id" {
#  description = "ID of the Vpc"
#  value       = aws_vpc.this.id
#}

#output "Region" {
#  description = "the region"
#  value       = data.aws_region.current.name
#}

#output "azs" {
#  description = "azs in this region"
#  value       = data.aws_availability_zones.current.names
#}

#output "az" {
#  description = "one az in this region"
#  value       = trimprefix( "${element(data.aws_availability_zones.current.names, 1)}" ,"${data.aws_region.current.name}")
#}