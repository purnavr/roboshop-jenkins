# Configure the Jenkins Provider
terraform {
  required_providers {
    jenkins = {
      source = "taiidani/jenkins"
      version = "0.10.2"
    }
  }
}


provider "jenkins" {
  server_url = "http://3.81.84.229:8080/"
  username   = data.aws_ssm_parameter.jenkins_user.value
  password   = data.aws_ssm_parameter.jenkins_pass.value
}

data "aws_ssm_parameter" "jenkins_user" {
  name = "jenkins.user"
}

data "aws_ssm_parameter" "jenkins_pass" {
  name = "jenkins.pass"
}