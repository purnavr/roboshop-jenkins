resource "jenkins_folder" "folders" {
  count = length(var.folders)
#  name = element(var.folders, count.index )
  name = var.folders[count.index]
}

resource "jenkins_job" "job" {
  count = length(var.jobs)
  name     = lookup(element(var.jobs, count.index ), "name", null )
  folder   = jenkins_folder.folders.id
  template = templatefile("${path.module}/sb-job.xml", {
    repo_url = lookup(element(var.jobs, count.index ), "repo_url", null )
  })
}