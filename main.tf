module "aci" {
  source = "git::https://github.com/Samaysinghai/newone.git"
}
terraform {
  backend "remote" {
    organization = "Samaysinghai"
    workspaces = {
      name = "Samaysinghai/newone"
    }
  }
}
