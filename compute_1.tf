resource "azurerm_network_interface" "nic1" {
  name                = "book-nic_1"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "bookipconfig1"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip_1.id
  }
}

resource "azurerm_public_ip" "pip_1" {
  name                = "book-ip_1"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  domain_name_label   = "bookdevops1"
}

resource "azurerm_virtual_machine" "vm1" {
  name                  = "bookvm1"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  vm_size               = "Standard_DS1_v2"
  network_interface_ids = [azurerm_network_interface.nic1.id]

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "book-osdisk1"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
    create_option     = "FromImage"
  }

  os_profile {
    computer_name  = "VMBOOK1"
    admin_username = "bookpackt"
    admin_password = "book123*"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = azurerm_storage_account.stor.primary_blob_endpoint
  }
}