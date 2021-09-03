# CentOS Packer Builder for Proxmox

This project provides Packer files to build a basic image of either CentOS 7 or CentOS 8 for use on a Proxmox system. Use it as is or as a starting point for a more fully customized image.

## Getting started

To use this you will need:

* This repo `git clone https://github.com/dustinrue/proxmox-packer.git`
* DVD ISO files for the OS you want to build an image for uploaded to Proxmox - [CentOS Downloads](https://wiki.centos.org/Download)
* A working [Proxmox](https://www.proxmox.com/en/) system
* [Packer](https://packer.io)
* The builder machine must be accessible to Proxmox or you must host the ks.cfg files somewhere publicly accessible and modify the packer.json file

**The OS ISO file will need to be uploaded to your Proxmox system.**

## Building an Image

You will first want to determine if your host running Packer can be accessed by the Proxmox host. This is because Packer will briefly run an http server so that the installer can download the kickstart file. If Proxmox is on the same network as your builder host and there are no other firewall restrictions on your builder host this should work fine. If not, you will need to copy/host the ks.cfg files on a publicly accessible server.

Next, you will need to know the URL to your Proxmox system, the name of the node to build on as well as a username and password of a user with sufficient privileges to create VMs and templates. If you have customized your install or are using a storage pool other than the default you will need to specify that as well. To build the CentOS 7 image would issue:

```
packer build \
  -var proxmox_node=hp-desktop \
  -var proxmox_username="root@pam" \
  -var proxmox_password=password \
  -var proxmox_url=https://192.168.0.1:8006/api2/json \
  centos7/packer.json
```

To build CentOS 8 issue:

```
packer build \
  -var proxmox_node=hp-desktop \
  -var proxmox_username="root@pam" \
  -var proxmox_password=password \
  -var proxmox_url=https://192.168.0.1:8006/api2/json \
  centos8/packer.json
```

To build Ubuntu 20.04 issue:

```
packer build \
  -var proxmox_node=hp-desktop \
  -var proxmox_username="root@pam" \
  -var proxmox_password=password \
  -var proxmox_url=https://192.168.0.1:8006/api2/json \
  ubuntu2004/packer.json
```

To build Rocky Linux 8 issue:

```
packer build \
  -var proxmox_node=hp-desktop \
  -var proxmox_username="root@pam" \
  -var proxmox_password=password \
  -var proxmox_url=https://192.168.0.1:8006/api2/json \
  rocky/packer.json
```

There are a number of other variables you can set. You will notice these closely match the available options for the [Proxmox builder](https://packer.io/docs/builders/proxmox.html). The full list of variables you can customize is:

* `proxmox_username` - username to log into Proxmox as
* `proxmox_password` - password to log into Proxmox as
* `proxmox_url` - URL of your Proxmox system
* `proxmox_node` - name of the Proxmox node to build on
* `proxmox_storage_pool` - name of the storage pool the image should be built on
* `proxmox_storage_pool_type` - type of storage pool, `lvm-thin` (default), `lvm` , `zfspool` or `directory`
* `proxmox_storage_format` - storage format, `raw` (default), `cow`, `qcow`, `qed`, `qcow2`, `vmdk` or `cloop` 
* `centos_image` - The CentOS DVD image. Defaults to the most recent release as of April 3, 2020
* `template_name` - Name of the template. Defaults to `CentOS7-Template` or `CentOS8-Template` depending on version
* `template_description` - Template description. Defaults to `CentOS 7 Template` or `CentOS 8 Template` depending on image being built.

## After the image is built

Once the image is built you will want to adjust any remaining settings in the template including creating a cloud-init drive. A cloud-init drive _must_ be created for you to ssh into any new VMs you create. For details on how to do so visit [https://blog.dustinrue.com/proxmox-cloud-init/](https://blog.dustinrue.com/proxmox-cloud-init/).
