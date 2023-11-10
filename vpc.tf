module "vpc" {
    source = "terraform-aws-module/vpc-aws"
    version = "2.9.0"
    name = "${var.project}-${terraform.workspace}-vpc"
    cidr = var.cidr
    private_subnets = var.private_subnets
    public_subnets  = var.public_subnets
    azs = var.azs
    enable_nat_gateway = var.enable_nat_gateway

    tags = local.common_tags

}