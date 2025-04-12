resource "aws_security_group" "alb_sg" {
    name = var.alb_sg_name
    vpc_id = var.vpc_id
    description = var.sg_description
    tags = {
      Name= "albsg"
    }

}


resource "aws_vpc_security_group_ingress_rule" "alb_ingress" {
    count = length(var.alb_security_group_rules)
    security_group_id = aws_security_group.alb_sg.id
    from_port = var.alb_security_group_rules[count.index].from_port
    to_port = var.alb_security_group_rules[count.index].to_port
    cidr_ipv4 = var.alb_security_group_rules[count.index].cidr_ipv4
    ip_protocol = var.alb_security_group_rules[count.index].ip_protocol
  
}

resource "aws_vpc_security_group_egress_rule" "alb_egress" {

  security_group_id=aws_security_group.alb_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = -1
}


resource "aws_security_group" "bastion_sg" {
    name = var.bastion_sg_name
    vpc_id = var.vpc_id
    description =var.bastion_description 
    tags={
        Name="bastionsg"
    }
  
}



resource "aws_vpc_security_group_ingress_rule" "bastion_ingress" {
    count = length(var.bastion_security_group_rules)
    security_group_id = aws_security_group.bastion_sg.id
    from_port = var.bastion_security_group_rules[count.index].from_port
    to_port = var.bastion_security_group_rules[count.index].to_port
    cidr_ipv4 = var.bastion_security_group_rules[count.index].cidr_ipv4
    ip_protocol = var.bastion_security_group_rules[count.index].ip_protocol
  
}

resource "aws_vpc_security_group_egress_rule" "bastion_egress" {

  security_group_id=aws_security_group.bastion_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = -1
}



