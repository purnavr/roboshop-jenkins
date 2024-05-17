#resource "jenkins_folder" "folders" {
#  count = length(var.folders)
#  name = var.folders[count.index]
#}
#
#
#
#
#resource "jenkins_job" "job" {
#  depends_on = [jenkins_folder.folders]
#
#  count = length(var.jobs)
#  name     = var.jobs[count.index].name
#  folder   = "/job/${lookup(element(var.jobs, count.index ), "folder", null )}"
#  template = templatefile("${path.module}/sb-job.xml", {
#    repo_url = var.jobs[count.index].repo_url
#    name = var.jobs[count.index].name
#  })
#
#  lifecycle {
#    ignore_changes = [template]
#  }
#}
#
#data "aws_instance" "jenkins" {
#  instance_id = "i-0c3412def8affb72e"
#}
#
#resource "aws_route53_record" "www" {
#  zone_id = "Z01280802SKTCPOFIGWX3"
#  name    = "jenkins.roboz.online"
#  type    = "A"
#  ttl     = 30
#  records = [data.aws_instance.jenkins.public_ip]
#}

resource "jenkins_folder" "folders" {
  count = length(var.folders)
  name = element(var.folders, count.index)
}

resource "jenkins_job" "jobs" {
  depends_on = [jenkins_folder.folders]

  count = length(var.jobs)
  name     = lookup(element(var.jobs, count.index), "name", null)
  folder   = "/job/${lookup(element(var.jobs, count.index), "folder", null)}"

  template = templatefile("${path.module}/sb-job.xml", {
    repo_url = lookup(element(var.jobs, count.index), "repo_url", null)
    name = lookup(element(var.jobs, count.index), "name", null)
  })

  lifecycle {
    ignore_changes = [template]
  }
}

data "aws_instance" "jenkins" {
  instance_id = "i-09e791412076778a9"
}

resource "aws_route53_record" "www" {
  zone_id = "Z0519871SX8ZUH6ORUV5"
  name    = "jenkins.devtb.online"
  type    = "A"
  ttl     = 30
  records = [data.aws_instance.jenkins.public_ip]
}












