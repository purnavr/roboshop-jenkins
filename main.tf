resource "jenkins_folder" "folders" {
  name = "infra"
}

resource "jenkins_job" "job" {
  name     = "roboshop"
  folder   = jenkins_folder.folders.id
  template = templatefile("${path.module}/sb-job.xml", {
    description = "An example job created from Terraform"
  })
}