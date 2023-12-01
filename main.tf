module "aci" {
  source = "git::ssh://git@github.com/Samaysinghai/automatictokenrepo.git"
  # other configuration
  git "aci" {
    depth = 1
  }
}
