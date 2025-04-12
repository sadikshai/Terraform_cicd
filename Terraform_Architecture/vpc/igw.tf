resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
      Name= var.igw_name
    }
  
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id

    }
  
}

resource "aws_route_table_association" "public" {
    count = length(var.private_cidr_block)
    subnet_id = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.public_rt.id
  
}


resource "aws_eip" "nat_eip" {
    count = length(var.private_cidr_block)
    domain = "vpc"
  
}

resource "aws_nat_gateway" "private_nat" {
    count =  length(var.private_cidr_block)
    allocation_id= aws_eip.nat_eip[count.index].id
    subnet_id=aws_subnet.public[count.index].id
    tags={
        Name="natgate_${count.index}"
    }

  
}


resource "aws_route_table" "private_rt" {
    count = length(var.private_cidr_block)
    vpc_id = aws_vpc.main.id
     tags={
         Name="private_route"
    }

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.private_nat[count.index].id
    }
    
  
}


resource "aws_route_table_association" "private" {
    count =  length(var.private_cidr_block)
    subnet_id = aws_subnet.private[count.index].id 
    route_table_id = aws_route_table.private_rt[count.index].id
  
}


