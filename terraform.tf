provider "aws" {
  version = "~> 3.0"
  region     = "us-east-2"
}

terraform {
  backend "s3"{
    encrypt        = true
    bucket         = "s3tobedeleted-backend"
    key            = "kpmg-dev/"
    region         = "us-east-2"
    #dynamodb_table = "terraform-locks"
  }
}