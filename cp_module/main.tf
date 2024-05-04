module "module_rg" {
  source = "../rg"
  rg_map = var.module_rg
}

module "module_vnet" {
  depends_on = [module.module_rg]
  source     = "../vnet"
  vnet_map   = var.module_vnet
}

module "module_subnet" {
    depends_on = [ module.module_vnet ]
    source = "../subnet"
    subnet = var.module_subnet
}

module "module_keyvault" {
    depends_on = [ module.module_rg,]
    source = "../key-vault"
    key_vault_map = var.module_keyvault
}

module "module_bastion" {
    depends_on = [ module.module_rg, module.module_vnet]
    source = "../bastion"
    bastion_map = var.module_bastain
}

module "module_vm" {
    depends_on = [ module.module_rg, module.module_vnet, module.module_subnet]
    source = "../vm"
    VM = var.module_vm
}

module "module_sql" {
    depends_on = [ module.module_rg ]
    source = "../SQLserver"
    rg_map = var.module_sql

}

module "module_lb" {
    depends_on = [module.module_rg, module.module_vnet]
    source = "../loadbalancer"
    lb_map = var.module_rg
    rg_map = var.module_rg
    VM = var.module_vnet

}

module "module_stg" {
    depends_on = [module.module_rg ]
    source = "../Storageaccount"
    sa = var.module_stg
}
