provider "github" {
  owner  = "Samaysinghai"
  token  = var.token
}

module "aci" {
  source = "git::https://github.com/Samaysinghai/newone.git"
  user_name = "Samaysinghai"
  token = "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"
}



