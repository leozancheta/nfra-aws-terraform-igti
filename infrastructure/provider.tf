
provider "aws" {
  region = var.region_aws
}

#Centralizar o arquivo de controle de estado do terraform
terraform {
  backend "s3" {
    bucket = "datalake-lz-igti-producao"
    key    = "state/infra/terraform/terraform.tfstate"
    region = "sa-east-1"
  }
}