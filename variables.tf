
variable "project" {
    type = string
    default = "odeseva"
}
# vpc
variable "cidr" {
    type = string
    default = "10.0.0.0/16"
  
}
variable "azs" {
    type = list
    default = ["eu-west1-a" ,"eu-west1-b"]
  
}

variable "private_subnets" {
    type = list
    default = ["10.0.1.0/24" ,"10.0.2.0/24"]
  
}

variable "public_subnets" {
    type = list
    default = ["10.0.101.0/24" ,"10.0.102.0/24"]
  
}
variable "enable_nat_gateway" {
    type = boolean
    default = true 
}

# cognito
variable "pool_name" {
    type = string
    default = "mypool"
}

variable "enable_cognito_user_pool" {
   type = boolean
   default = false
}

variable "email_verification_subject" {
    type = string
    default ="Verification message"
}
variable "email_verification_message" {
    type = string
    default = "Verification code: {###}"
}

variable "generate_secret" {
    type = boolean
    default = false
}

variable "callback_url" {
    type = list
    default = ["https://example.com/login/callback"]
}

