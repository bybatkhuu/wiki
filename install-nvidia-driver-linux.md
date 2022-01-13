# Install NVIDIA GPU driver on Ubuntu (16.04/18.04/20.04)

## Disable automatic updates on Ubuntu

```bash
# 1. Disable auto-update and auto-upgrade:
echo 'APT::Periodic::Update-Package-Lists "0";' | sudo tee /etc/apt/apt.conf.d/20auto-upgrades
echo 'APT::Periodic::Unattended-Upgrade "0";' | sudo tee -a /etc/apt/apt.conf.d/20auto-upgrades
```

## Disable open-source nouveau driver

```bash
# 2. Write blacklist options for the nouveau driver (disable):
echo "blacklist nouveau" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf

# 3. Update kernel initramfs for blacklist (modprobe.d) options:
sudo update-initramfs -u
```

## Install essential packages

```bash
# 4. Clean apt package manager lists and caches:
sudo rm -vrf /var/lib/apt/lists/* /var/cache/apt/archives/* /tmp/*
sudo apt-get clean -y

# 5. Updating, indexing, and caching apt package manager app lists:
sudo apt-get update --fix-missing -o Acquire::CompressionTypes::Order::=gz

# 6. Upgrade and reinstall ubuntu base packages:
sudo apt-get upgrade -y

# 7. Remove old or unnecessary leftover packages:
sudo apt-get autoremove -y

# 8. IMPORTANT! Install dkms and base packages:
sudo apt-get install -y build-essential libglvnd-dev pkg-config dkms wget
```

## Download appropriate Linux driver for current NVIDIA GPU model

* Search and download the latest verified stable NVIDIA GPU driver binary (**NVIDIA-Linux-x86_64-\*\*\*.run**) installer file from this link: **[https://www.nvidia.com/Download/Find.aspx?lang=en-us](https://www.nvidia.com/Download/Find.aspx?lang=en-us)**
* **IMPORTANT!** Don't download and use **.deb** installer file. It's **HARD and FRUSTRATING** to update NVIDIA GPU driver later or remove without leftovers and ...
* If you're using a command-line interface, just copy the download link and use wget to download.
For example:

```bash
# 9. IMPORTANT! Download appropriate Linux driver for current NVIDIA GPU model
mkdir -v ~/Downloads
cd ~/Downloads
wget https://us.download.nvidia.com/***/***/NVIDIA-Linux-x86_64-***.run
```

## Preparation steps before installing NVIDIA GPU driver

### [IMPORTANT] Change GUI environment to console environment

* **Skip this step to 11, if you're not using GUI environment and already using console environment or SSH**
* **TIP:** From here you're going to enter to the console environment, so you need to write down these below commands on some text file to read from command-line or note on somewhere!
* You can change GUI environment to virtual console environment by pressing these keyboard buttons: **Ctrl + Alt + F1/F3**
* Or by entering the Linux command:

```bash
# 10. IMPORTANT! Entering into virtual console environment:
sudo chvt 1
# OR
sudo chvt 3
```

* Enter username and password to log in to a console environment

### Stop GUI processes to prepare the installation of NVIDIA GPU driver

```bash
# 11. Stop GUI service (lightdm/gdm/gdm3/kdm/slim/etc..):
sudo service lightdm stop
# OR
sudo service gdm stop
# OR
sudo service gdm3 stop

# 12. Initialize and refresh console environment without X11 (GUI) processes:
sudo init 3

# 13. Change permission of NVIDIA-Linux-x86_64-***.run driver installer file to executable:
cd ~/Downloads
sudo chmod +x ./NVIDIA-Linux-x86_64-***.run
```

## Install NVIDIA GPU driver

* **IMPORTANT!** (**--dkms**) Register Nvidia driver to the DKMS for future kernel upgrade.
* **IMPORTANT!** (**--no-x-check**) Disable X11 config checker to prevent triggering X11 (GUI) processes while installing the driver.
* **IMPORTANT!** (**--no-cc-version-check**) Disable C/C++ version checker to prevent install error occurs when DKMS C/C++ version is not matching with current installed C/C++ version!

```bash
# 14. IMPORTANT! Install nvidia driver with appropriate arguments:
sudo ./NVIDIA-Linux-x86_64-***.run --no-x-check --no-cc-version-check --dkms
```

* Select 'Continue installation' on the warning message.
* **IMPORTANT!** Select '**Yes**' for the register of the DKMS kernel module.
* Select '**No**' for 32-bit compatibility installation OR select '**OK**' when a 32-bit compatibility error appears.
* **IMPORTANT!** Select '**No**' when it asks to automatically update your X configuration file.

```bash
# 15. Reboot system:
sudo shutdown -r now

# 16. Check nvidia driver is installed:
nvidia-smi
```

:sparkles: :+1:

## INSTALLATION COMPLETE

---

## [OPTIONAL] Setup nvidia-persistence mode daemon (For Deep Learning)

```bash
# Install git to clone
sudo apt-get install -y ssh git

# Download nvidia-persistenced source code from github:
git clone https://github.com/NVIDIA/nvidia-persistenced.git

# Install nvidia-persistenced service daemon:
cd nvidia-persistenced/init
sudo ./install.sh

# Remove downloaded files:
cd ../..
rm -rf nvidia-persistenced

# Check nvidia-persistence mode is ON:
nvidia-smi
```

---

## [OPTIONAL] Install NVIDIA GPU monitoring tool

### :star2::satellite: nvitop

```bash
# Install python3 and pip3 packages:
sudo apt-get install -y python3 python3-pip

# Install nvitop into system python3 packges:
sudo pip3 install nvitop
# Or install nvitop into current custom python3 packges:
pip3 install nvitop

# Check nvitop:
nvitop -m full
```

* [https://pypi.org/project/nvitop](https://pypi.org/project/nvitop)
* [https://github.com/XuehaiPan/nvitop](https://github.com/XuehaiPan/nvitop)

### :bar_chart: nvtop

```bash
# Install cmake, ncurses and git:
sudo apt-get install -y cmake libncurses5-dev libncursesw5-dev

# Download nvtop source code from github:
git clone https://github.com/Syllo/nvtop.git
mkdir -vp nvtop/build && cd nvtop/build

cmake ..
# If it errors with "Could NOT find NVML (missing: NVML_INCLUDE_DIRS)"
# try the following command instead, otherwise skip to the build with make:
#cmake .. -DNVML_RETRIEVE_HEADER_ONLINE=True

make
sudo make install

# Remove downloaded files:
cd ../..
rm -rf nvtop

# Check nvtop:
nvtop
```

* [https://github.com/Syllo/nvtop](https://github.com/Syllo/nvtop)
* [https://www.programmersought.com/article/32983927335](https://www.programmersought.com/article/32983927335)

---

## References

* [https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html#runfile](https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html#runfile)
* [https://docs.nvidia.com/deploy/driver-persistence/index.html#persistence-daemon](https://docs.nvidia.com/deploy/driver-persistence/index.html#persistence-daemon)
* [https://bybatkhuu.medium.com/install-nvidia-gpu-driver-on-ubuntu-18-04-c9edc125e5a1#c133-82a7cf6c83d4](https://bybatkhuu.medium.com/install-nvidia-gpu-driver-on-ubuntu-18-04-c9edc125e5a1#c133-82a7cf6c83d4)
