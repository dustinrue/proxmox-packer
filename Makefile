proxmox_storage_pool = 

.PHONY: rocky8 rocky9 rocky10 ubuntu2004 ubuntu2204 ubuntu2404 ubuntu2604 debian13 all

all: rocky8 rocky9 ubuntu2004 ubuntu2204
rocky8:
	packer init rocky8/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl rocky8/packer.pkr.hcl

rocky9:
	packer init rocky9/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl rocky9/packer.pkr.hcl

rocky10:
	packer init rocky10/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl rocky10/packer.pkr.hcl

ubuntu2004:
	packer init ubuntu2004/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl ubuntu2004/packer.pkr.hcl

ubuntu2204:
	packer init ubuntu2204/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl ubuntu2204/packer.pkr.hcl

ubuntu2404:
	packer init ubuntu2404/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl ubuntu2404/packer.pkr.hcl

ubuntu2604:
	packer init ubuntu2604/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl ubuntu2604/packer.pkr.hcl

debian13:
	packer init debian13/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl debian13/packer.pkr.hcl

almalinux9:
	packer init almalinux9/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl almalinux9/packer.pkr.hcl
