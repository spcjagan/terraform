provider "aws" {
     region = "ap-south-1"
     access_key = "AKIAUJWZEZKPWNFG37PZ"
     secret_key = "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"
     
}

resource "aws_instance" "my-first-terraform-EC21" {
    ami = "ami-01a4f99c4ac11b03c"
     instance_type = "t2.micro" 
     tags = {
         "Name" = "my-first-terraform-EC21"
         }
}


resource "aws_vpc" "terraform-vpc1" {
     cidr_block = "10.0.0.0/16"
     tags = {
         "Name" = "terraform-vpc1" }
}


resource "aws_subnet" "public-subnet" {
     cidr_block = "10.0.0.0/24"
     vpc_id = aws_vpc.terraform-vpc1.id
     tags = {
         "Name" = "terra-public-subnet"
          }
}

resource "aws_internet_gateway" "terra-internet-gateway" {
     vpc_id = aws_vpc.terraform-vpc1.id
     tags = {
         "Name" = "terra-internet-gateway"
          }
}

resource "aws_route_table" "terra_rt" {
    vpc_id = aws_vpc.terraform-vpc1.id
    tags = { 
        "Name" = "terra_rt" 
        }
    
}


resource "aws_route" "terra_route" {
 route_table_id = aws_route_table.terra_rt.id
 destination_cidr_block = "0.0.0.0/0"
 gateway_id = aws_internet_gateway.terra-internet-gateway.id
 }