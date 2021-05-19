# infracode-HA
Terraform code for HA compute and DB.

VPC along with HA subnets and NAT gateway placed for internal routing.
This terraform code creates HA compute with ASG configured.
ALB will be created with HTTP listner rules.
RDS will be leveragin the mutli zones instances for HA.

![image (2)](https://user-images.githubusercontent.com/16948226/118877303-e7d1d780-b90b-11eb-854b-e5bb2bd395f5.png)


