# Linux boot partition

## Prerequisites

* Disable Secure Boot
* Disable Fast Boot

## Partition list

### [REQUIRED] EFI partition

* Size: **500 MB**
* Type: **Primary**
* Location: **Beggining**
* Use as: **EFI System Partition**

### [OPTIONAL] Swap partition (If RAM memory is less than 16 GB)

* Size: **4GB ~ 8GB**
* Type: **Logical**
* Location: **Beginning**
* Use as: **Swap area**

### [REQUIRED] Root partition

* Size: **Remaining size**
* Type: **Logical**
* Location: **Beginning**
* Use as: **Ext4**
* Mount point: **/**
