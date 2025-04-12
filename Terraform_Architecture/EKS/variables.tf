variable "iam_cluster_name" {
    type=string
  
}

variable "eks_name" {
    type=string
  
}


variable "subnet_id" {
    type = list(string)
  
}


variable "node_name_iam" {
    type=string
  
}


variable "node_group_name" {
    type=string
  
}


variable "desired_size" {
    type=number
  
}

variable "max_size" {
    type = number
  
}


variable "min_size" {
    type = number
  
}


variable "instance_types" {
    type = list(string)
  
}