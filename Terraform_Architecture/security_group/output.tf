output "alb_sg_id" {
    value = aws_security_group.alb_sg.id
  
}

output "alb_sg_name" {
    value = aws_security_group.alb_sg.name
  
}


output "bastion_sg_id" {
    value = aws_security_group.bastion_sg.id
  
}

output "bastion_sg_name" {
    value = aws_security_group.bastion_sg.name
  
}