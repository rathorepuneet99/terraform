terraform {
  backend "s3" {
    bucket         = "terraform-state-free"
    key            = "ec2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}