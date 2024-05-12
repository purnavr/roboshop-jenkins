# Configure the Jenkins Provider
terraform {
  required_providers {
    jenkins = {
      source = "taiidani/jenkins"
      version = "0.10.2"
    }
  }
}

#terraform {
#  required_providers {
#    jenkins = {
#      source = "registry.terraform.io/taiidani/jenkins"
#    }
#  }
#}


provider "jenkins" {
  server_url = "http://23.20.215.142:8080/"
  username   = data.aws_ssm_parameter.jenkins_user.value
  password   = data.aws_ssm_parameter.jenkins_pass.value
}

data "aws_ssm_parameter" "jenkins_user" {
  name = "jenkins.user"
}

data "aws_ssm_parameter" "jenkins_pass" {
  name = "jenkins.pass"
}