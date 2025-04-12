output "vpc_id" {
    value = module.vpc.vpc_id
  
}

output "public_subnet_id"{
    value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
    value = module.vpc.private_subnet_id
  
}


output "albsg_name" {
    value = module.security_group.alb_sg_name
  
}

output "albsg_id" {
    value= module.security_group.alb_sg_id
  
}



output "bastionsg_name" {
    value = module.security_group.bastion_sg_name
  
}

output "bastion_sg_id" {
    value= module.security_group.bastion_sg_id
  
}


output "ip_address" {
    value=module.bastion.instance_id
  
}



