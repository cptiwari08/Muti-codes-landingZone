module_rg = {
  rg01 = {
    resource_group_name = "cptiwari-rg"
    location            = "eastus2"

  }

  module_vnet = {
    vnet01 = {
      vnet_name           = "cpt_vnet"
      vnet_location       = "eastus2"
      resource_group_name = "cptiwari-rg"
      address_space       = ["10.0.0.0/16"]
    }
  }

  module_subnet = {
    sb01 = {
      resource_group_name   = "cptiwari-rg"
      location              = "eastus2"
      vnet_name             = "cpt_vnet"
      subnet_name           = "frontend-subnet"
      address_prefixes_sb = ["10.0.1.0/24"]
    }

    sb002 = {
      resource_group_name   = "cptiwari-rg"
      location              = "eastus2"
      location              = "eastus2"
      vnet_name             = "cpt_vnet"
      subnet_name           = "backend-subnet"
      address_prefixes_sb = ["10.0.2.0/24"]
    }

        sb003 = {
      resource_group_name   = "cptiwari-rg"
      location              = "eastus2"
      vnet_name             = "cpt_vnet"
      bastion_name           = "AzureBastionSubnet"
      address_prefixes_sb = ["10.0.3.0/24"]
      allocation_method     = "Static"
      ip_name               = "bastionpip"
      sku                   = "Standard"
      bastion_name_name     = "tiwari-bastion"
    }
  }
  # module_bastain = {
  #   bs01 = {
  #     resource_group_name   = "cptiwari-rg"
  #     location              = "eastus2"
  #     vnet_name             = "cpt_vnet"
  #     bastion_name_name     = "tiwari-bastion"
  #     # address_prefixes_sb01 = ["10.0.3.0/24"]
  #     allocation_method     = "Static"
  #     ip_name               = "bastionpip"
  #     sku                   = "Standard"
  #   }
  # }
  module_vm = {
    vm01 = {
      resource_group_name           = "cptiwari-rg"
      location                      = "eastus2"
      subnet_name                   = "frontend-subnet"
      address_prefixes_sb01         = ["10.0.2.0/24"]
      keyvault_name                 = "tiwarisecrets008"
      name_ip                       = "public-ip1"
      name_VM                       = "frontend-vm"
      vm_size                       = "Standard_F2"
      name_disk                     = "dardey1-disco"
      caching                       = "ReadWrite"
      create_option                 = "FromImage"
      managed_disk_type             = "Standard_LRS"
      computer_name                 = "hostname1"
      private_ip_address_allocation = "Dynamic"
      allocation_method             = "Static"
      sku                           = "Standard"
      vnet_name                     = "cpt_vnet"
      stg_name                      = "stgtiwari01"
      name_sql                      = "cpt-sqlserver1"
      name_db                       = "cpt-sqldatabase1"
    }
  }
  vm2 = {
    resource_group_name           = "cptiwari-rg"
    location                      = "eastus2"
    subnet_name                   = "backend-subnet"
    address_prefixes_sb01         = ["10.0.2.0/24"]
    keyvault_name                 = "tiwari-secrets008-1"
    name_ip                       = "public-ip2"
    name_VM                       = "backend-vm"
    vm_size                       = "Standard_F2"
    name_disk                     = "dardey2-disco"
    caching                       = "ReadWrite"
    create_option                 = "FromImage"
    managed_disk_type             = "Standard_LRS"
    computer_name                 = "hostname1"
    allocation_method             = "Static"
    sku                           = "Standard"
    stg_name                      = "stgtiwari02"
    name_sql                      = "cpt-sqlserver2"
    name_db                       = "cpt-sqldatabase2"
  }
}

module_keyvault = {
  key01 = {
    resource_group_name = "cptiwari-rg"
    location            = "eastus2"
    keyvault_name       = "cpt-keyvault-01"
  }

  key02 = {
    resource_group_name = "cptiwari-rg"
    location            = "eastus2"
    keyvault_name       = "cpt-keyvault-02"
  }
}

module_stg = {
  stg1 = {
    resource_group_name = "cptiwari-rg"
    location            = "eastus2"
    stg_name_name       = "cpt-stg008-01"
  }
  stg2 = {
    resource_group_name = "cptiwari-rg"
    location            = "eastus2"
    stg_name_name       = "cpt-stg008-02"
  }
}

module_sql = {
  sql = {
    name_sql            = "mytestingsql"
    resource_group_name = "cptiwari-rg"
    location            = "eastus2"
    name_db             = "testdb"
  }
}
