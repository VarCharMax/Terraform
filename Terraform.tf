terraform {
	backend "azurerm" {
		storage_account_name = "storageremotetf12"
		container_name = "tfbackends"
		key = "myappli.tfstate"
		access_key = "Y+OqQEVwoQCV61cclU7co4OPIMe5vshW+mKFXLV/ZMzdiB5CFYNofXhsI4LWhe2MvuArLcnuoRcJfj4A5uLjHA=="
	}
}