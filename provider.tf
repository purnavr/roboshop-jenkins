terraform {
  required_providers {
    jenkins = {
      source = "taiidani/jenkins"
    }
  }
}

provider "jenkins" {
  server_url = "http://34.227.87.99:8080/"
  username   = data.aws_ssm_parameter.jenkins_user.value
  password   = data.aws_ssm_parameter.jenkins_pass.value
}

data "aws_ssm_parameter" "jenkins_user" {
  name = "jenkins.user"
}

data "aws_ssm_parameter" "jenkins_pass" {
  name = "jenkins.pass"
}


#terraform {
#  required_providers {
#    jenkins = {
#      source = "registry.terraform.io/taiidani/jenkins"
#    }
#  }
#}

#provider "jenkins" {
#  server_url = "http://34.238.142.237:8080/"
#  username   = data.aws_ssm_parameter.jenkins_user.value
#  password   = data.aws_ssm_parameter.jenkins_pass.value
#}
#
#data "aws_ssm_parameter" "jenkins_user" {
#  name = "jenkins.user"
#}
#
#data "aws_ssm_parameter" "jenkins_pass" {
#  name = "jenkins.pass"
#}
