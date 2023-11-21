provider "github" {
  owner = "Samaysinghai"
  token = ""
}

data "github_repository" "current" {
  full_name = "https://github.com/Rahulsurya1/checkaccesstoken.git"
}

output "repository_url" {
  value = data.github_repository.current.html_url
}

output "repository_ssh_url" {
  value = data.github_repository.current.ssh_url
}
