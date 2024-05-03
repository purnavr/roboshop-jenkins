terraform {
  backend "s3" {
    bucket = "roboz-st"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
