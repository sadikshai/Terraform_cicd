module "vpc" {
    source = "./vpc"
    vpc_name = "myvpc"
    vpc_cidr = "10.0.0.0/16"
    pub_cidr_block = [ "10.0.0.0/24","10.0.1.0/24","10.0.2.0/24" ]
    pub_az = [ "ap-south-1a","ap-south-1b","ap-south-1c" ]
    private_cidr_block = [ "10.0.3.0/24","10.0.4.0/24","10.0.5.0/24" ]
    private_az = [ "ap-south-1a","ap-south-1b","ap-south-1c" ]
    igw_name = "myigw"
  
}


module "EKS" {
    source = "./EKS"
    iam_cluster_name = "example"
    eks_name = "basecluster"
    subnet_id = module.vpc.private_subnet_id
    node_name_iam = "eks-node-group"
    node_group_name = "example"
    desired_size = 3
    max_size = 5
    min_size = 1
    instance_types = ["t3.medium"]
    
}


module "security_group" {
    source="./security_group"
    alb_sg_name = "alb_securitygroup"
    vpc_id = module.vpc.vpc_id
    sg_description = "this is for appliation load balancer"
    alb_security_group_rules = [ 
        {
            ip_protocol = "tcp"
            from_port = 443
            to_port = 443
        },
        {
            ip_protocol = "tcp"
            from_port = 80
            to_port = 80
        }

     ]
    bastion_sg_name = "bastion_securitygroup"
    bastion_description = "this is for bastion security group"
    bastion_security_group_rules = [ 
        {
            from_port=22
            to_port=22
            ip_protocol="tcp"

        },

        {
            from_port=80
            to_port=80
            ip_protocol="tcp"

        }
     ]

    


  
}


module "bastion" {
    source="./bastion"
    ami_value = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
    ami_owner = "099720109477"
    instance_key_name = "my_id"
    security_bn = module.security_group.bastion_sg_id
    subnet_id = module.vpc.public_subnet_id[2]
    instance_type = "t3.medium"
    instance_name = "bastion"


  
}



