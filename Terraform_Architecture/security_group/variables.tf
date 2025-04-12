variable "alb_sg_name" {
    type = string
  
}

variable "vpc_id" {
    type=string
  
}

variable "sg_description" {
    type=string
  
}


variable "alb_security_group_rules" {
    type = list(object({
      cidr_ipv4 = optional(string,"0.0.0.0/0")
      from_port=number
      to_port=number
      ip_protocol=optional(string,"tcp")
    }))
  
}



variable "bastion_sg_name" {
    type=string
  
}



variable "bastion_description" {
    type=string
  
}




variable "bastion_security_group_rules" {
    type = list(object({
      cidr_ipv4 = optional(string,"0.0.0.0/0")
      from_port=number
      to_port=number
      ip_protocol=optional(string,"tcp")
    }))
  
}