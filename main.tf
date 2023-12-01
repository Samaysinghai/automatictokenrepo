module "aci" {
  source = "git::https://Samaysinghai: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@github.com/Samaysinghai/newone.git"

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
