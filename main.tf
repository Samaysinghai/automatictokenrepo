provider "github" {
  owner = "Samaysinghai"
  token = "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"
}

data "github_repository" "current" {
  full_name = "Samaysinghai/accessibleRepo"
}

output "repository_url" {
  value = data.github_repository.current.html_url
}

output "repository_ssh_url" {
  value = data.github_repository.current.ssh_url
}
