#VPC

output "vpc_id" {
  value = aws_vpc.main.id
}

locals {
  #TO FORMAT THE SUBNET IDs WHICH MAY BE MULTIPLES IN FORMAT OF subnet_name = {id=, az=}  
  public_subnet_output = {
    for key, config in local.public_subnet : key => {
      subnet_id = aws_subnet.main[key].id
      az        = aws_subnet.main[key].availability_zone
    }
  }

    private_subnet_output = {
    for key, config in local.private_subnet : key => {
      subnet_id = aws_subnet.main[key].id
      az        = aws_subnet.main[key].availability_zone
    }
  }
}

#SUBNETS DETAILS
output "public_subnets" {
  value = local.public_subnet_output
}

output "private_subnets" {
  value = local.private_subnet_output
}
