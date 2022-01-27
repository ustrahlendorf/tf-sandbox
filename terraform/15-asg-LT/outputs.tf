output "ec2_role" {
  description = "instance profile for EC2"
  value       = data.aws_iam_instance_profile.this.arn
}

#output "vpc_id" {
#  description = "ID of the Vpc"
#  value       = data.aws_vpc.this.id
#}
#
#output "pub_subnets_id" {
#  description = "IDs of the subnets"
#  value       = data.aws_subnet_ids.public.ids
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