proxmox_storage_pool = 

.PHONY: centos7 centos8 rocky8 rocky9 ubuntu2004 ubuntu2204 ubuntu2404 all

all: centos7 centos8 rocky8 rocky9 ubuntu2004 ubuntu2204
centos7:
	packer init centos7/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl centos7/packer.pkr.hcl

centos8:
	packer init centos8/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl centos8/packer.pkr.hcl

rocky8:
	packer init rocky8/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl rocky8/packer.pkr.hcl

rocky9:
	packer init rocky9/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl rocky9/packer.pkr.hcl

ubuntu2004:
	packer init ubuntu2004/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl ubuntu2004/packer.pkr.hcl

ubuntu2204:
	packer init ubuntu2204/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl ubuntu2204/packer.pkr.hcl

ubuntu2404:
	packer init ubuntu2404/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl ubuntu2404/packer.pkr.hcl

almalinux9:
	packer init almalinux9/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl almalinux9/packer.pkr.hcl
