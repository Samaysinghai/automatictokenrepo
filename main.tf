module "aci" {
  source = "git::https://github.com/Samaysinghai/newone.git"

github_credentials = {
    username = "Samaysinghai"
    token    = "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"
  }

}
variable "github_credentials" {
  description = "GitHub credentials for authentication"
  type        = map(string)
}

provider "github" {
  owner = var.github_credentials["Samaysinghai"]
  token = var.github_credentials["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"]
}



