proxmox_storage_pool = 

.PHONY: centos7 centos8 rocky8 rocky9 ubuntu2004 ubuntu2204

centos7:
	packer build -var-file variables.pkrvars.hcl centos7/packer.pkr.hcl

centos8:
	packer build -var-file variables.pkrvars.hcl centos8/packer.pkr.hcl

rocky8:
	packer build -var-file variables.pkrvars.hcl rocky8/packer.pkr.hcl

rocky9:
	packer build -var-file variables.pkrvars.hcl rocky9/packer.pkr.hcl

ubuntu2004:
	packer build -var-file variables.pkrvars.hcl ubuntu2004/packer.pkr.hcl

ubuntu2204:
	packer build -var-file variables.pkrvars.hcl ubuntu2004/packer.pkr.hcl
