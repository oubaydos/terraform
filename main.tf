module "my_instance" {
  source     = "./modules/instance"
  depends_on = [module.firewell]
}
module "firewell" {
  source = "./modules/firewall"
}
