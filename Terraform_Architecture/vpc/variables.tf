variable "vpc_cidr" {
  type = string
  
}

variable "vpc_name" {
    type = string
  
}

variable "pub_cidr_block" {
    type = list(string)
  
}

variable "pub_az" {
    type = list(string)
  
}


variable "private_cidr_block" {
    type = list(string)
  
}

variable "private_az" {
    type = list(string)
  
}


variable "igw_name" {
    type = string
  
}