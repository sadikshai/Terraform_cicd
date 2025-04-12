resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    tags = {
      Name=var.vpc_name
    }
  
}


resource "aws_subnet" "public" {
    count =length(var.pub_cidr_block) 
    vpc_id = aws_vpc.main.id
    cidr_block = var.pub_cidr_block[count.index]
    availability_zone = var.pub_az[count.index]
    tags = {
      Name="public-${count.index+1}"
    }
    
  
}


resource "aws_subnet" "private" {
    count = length(var.private_cidr_block)
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_cidr_block[count.index]
    availability_zone = var.private_az[count.index]
    tags = {
      Name="private-${count.index+1}"
    }

  
}