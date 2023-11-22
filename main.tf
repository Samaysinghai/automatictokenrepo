provider "github" {
  owner = var.gh_username
  token = var.gh_token
} 
variable "repository_url" {
  description = "https://github.com/Rahulsurya1/checkaccesstoken.git"
}

output "repository_url" {
  value = data.github_repository.current.html_url
}

output "repository_ssh_url" {
  value = data.github_repository.current.ssh_url
}





