variable "folders" {
  default = ["infra", "CI-pipeline"]
}

variable "m-jobs" {
  default = [
    { name = "roboshop", folder = "infra", repo_url = "https://github.com/purnavr/roboshop-infra.git" },
    { name = "frontend", folder = "CI-pipeline", repo_url = "https://github.com/purnavr/frontend.git" },
    { name = "catalogue", folder = "CI-pipeline", repo_url = "https://github.com/purnavr/catalogue.git" },
    { name = "user", folder = "CI-pipeline", repo_url = "https://github.com/purnavr/user.git" },
    { name = "cart", folder = "CI-pipeline", repo_url = "https://github.com/purnavr/cart.git" },
    { name = "shipping", folder = "CI-pipeline", repo_url = "https://github.com/purnavr/shipping.git" },
    { name = "payment", folder = "CI-pipeline", repo_url = "https://github.com/purnavr/payment.git" },
  ]
}

variable "s-jobs" {
  default = []
}