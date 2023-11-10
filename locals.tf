locals {
    common_tags = {
        Terraform = true
        Environment = "${terraform.workspace}"
        Project = var.project
    }
}
