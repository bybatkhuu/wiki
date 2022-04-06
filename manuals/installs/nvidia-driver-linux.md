# Install NVIDIA GPU driver on Linux (Ubuntu/Debian)

## Official pages

- NVIDIA driver downloads: [https://www.nvidia.com/Download/Find.aspx?lang=en-us](https://www.nvidia.com/Download/Find.aspx?lang=en-us)
- NVIDIA driver installation: [https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html#runfile](https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html#runfile)
- NVIDIA driver configuration instructions: [https://download.nvidia.com/XFree86/Linux-x86_64/510.47.03/README/installdriver.html](https://download.nvidia.com/XFree86/Linux-x86_64/510.47.03/README/installdriver.html)
- NVIDIA persistence: [https://docs.nvidia.com/deploy/driver-persistence/index.html#persistence-daemon](https://docs.nvidia.com/deploy/driver-persistence/index.html#persistence-daemon)
- NVIDIA persistenced github: [https://github.com/NVIDIA/nvidia-persistenced](https://github.com/NVIDIA/nvidia-persistenced)

---

## Install NVIDIA GPU driver

### Disable automatic updates on Ubuntu/Debian

```bash
# 1. Disable auto-update and auto-upgrade:
echo 'APT::Periodic::Update-Package-Lists "0";' | sudo tee /etc/apt/apt.conf.d/20auto-upgrades
echo 'APT::Periodic::Unattended-Upgrade "0";' | sudo tee -a /etc/apt/apt.conf.d/20auto-upgrades
```

### Disable open-source nouveau driver

```bash
# 2. Write blacklist options for the nouveau driver (disable):
echo "blacklist nouveau" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf

# 3. Update kernel initramfs for blacklist (modprobe.d) options:
sudo update-initramfs -u
```

### Install essential packages

```bash
# 4. Clean apt package manager lists and caches:
sudo rm -vrf /var/lib/apt/lists/* /var/cache/apt/archives/* /tmp/*
sudo apt-get clean -y

# 5. Updating, indexing, and caching apt package manager app lists:
sudo apt-get update --fix-missing -o Acquire::CompressionTypes::Order::=gz

# 6. Upgrade and reinstall OS base packages:
sudo apt-get upgrade -y

# 7. Remove old or unnecessary leftover packages:
sudo apt-get autoremove -y

# 8. IMPORTANT! Install dkms and base packages:
sudo apt-get install -y build-essential pkg-config libglvnd-dev mesa-utils wget dkms
```

### Download the appropriate Linux driver for the current NVIDIA GPU model

- Search and download the latest verified stable NVIDIA GPU driver (**NVIDIA-Linux-x86_64-\*\*\*.run**) installer file from this link: **[https://www.nvidia.com/Download/Find.aspx?lang=en-us](https://www.nvidia.com/Download/Find.aspx?lang=en-us)**
- **IMPORTANT!** **Download and use the .RUN file!** It can install the NVIDIA driver with the **DKMS module**, which is really important!
- **IMPORTANT!** **Don't download or use the .DEB file!** It will **BREAK** the kernel eventually, especially when the kernel header/version/module is upgraded, which is so **FRUSTRATING!** Therefore, sometimes conflict with other application **dependencies** (dependency hell)...
- If you're using a command-line interface, just copy the download link and use wget to download. For example:

```bash
mkdir -v ~/Downloads
cd ~/Downloads

# 9. (Skip this, if you've already downloaded) Download appropriate Linux driver for current NVIDIA GPU model
wget https://us.download.nvidia.com/[GPU_MODEL_TYPE_URL]/NVIDIA-Linux-x86_64-[DRIVER_VERSION].run
# For example:
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/510.54/NVIDIA-Linux-x86_64-510.54.run
```

### Preparation steps before installing NVIDIA GPU driver

#### [IMPORTANT] Change GUI environment to console environment

- **Skip this step to 11, if you're not using a GUI environment and already using a console environment or SSH**
- **TIP:** From here you're going to enter the console environment, so you need to write down these below commands on some text file to read from command-line or note on somewhere!
- You can change the GUI environment to a virtual console environment by pressing these keyboard buttons: **Ctrl + Alt + F1/F3**
- Or by entering the Linux command:

```bash
# 10. IMPORTANT! Entering into virtual console environment:
sudo chvt 1
# Or:
sudo chvt 3
```

- Enter username and password to log in to a console environment

#### Stop GUI processes to prepare the installation of the NVIDIA GPU driver

```bash
# 11. Stop GUI service (lightdm/gdm/gdm3/kdm/slim/etc..):
sudo service lightdm stop
# Or:
sudo service gdm stop
# Or:
sudo service gdm3 stop

# 12. Initialize and refresh console environment without X11 (GUI) processes:
sudo init 3

# Change directory to NVIDIA-Linux-x86_64-***.run driver downloaded directory. For example:
cd ~/Downloads

# 13. Change permission of NVIDIA-Linux-x86_64-***.run driver installer file to executable:
chmod +x ./NVIDIA-Linux-x86_64-[DRIVER_VERSION].run
# For example:
chmod +x ./NVIDIA-Linux-x86_64-510.54.run
```

### Install NVIDIA driver.run file

- **IMPORTANT!** (**--dkms**) Register Nvidia driver to the DKMS for future kernel upgrade.
- **IMPORTANT!** (**--no-x-check**) Disable the X11 config checker to prevent triggering X11 (GUI) processes while installing the driver.
- **IMPORTANT!** (**--no-cc-version-check**) Disable the C/C++ version checker to prevent install error occurs when the DKMS C/C++ version is not matching with the current installed C/C++ version!

```bash
# 14. IMPORTANT! Install nvidia driver with appropriate arguments:
sudo ./NVIDIA-Linux-x86_64-[DRIVER_VERSION].run --no-x-check --no-cc-version-check --dkms
# For example:
sudo ./NVIDIA-Linux-x86_64-510.54.run --no-x-check --no-cc-version-check --dkms
```

- Select 'Continue installation' on the warning message.
- **IMPORTANT!** Select '**Yes**' for the register of the DKMS kernel module.
- Select '**No**' for 32-bit compatibility installation OR select '**OK**' when a 32-bit compatibility error appears.
- **IMPORTANT!** Select '**No**' when it asks to automatically update your X configuration file.

```bash
# 15. Remove downloaded file:
rm -vf ./NVIDIA-Linux-x86_64-[DRIVER_VERSION].run
# For example:
rm -vf ./NVIDIA-Linux-x86_64-510.54.run

# 16. Reboot system:
sudo shutdown -r now

# 17. Check nvidia driver is installed:
nvidia-smi
```

## Post-installation

### [Only for ML/DL server] Setup nvidia-persistence mode daemon

Not recommended: GPU that is used by X11/Wayland processes (for GUI rendering).

```bash
# Install git to clone:
sudo apt-get install -y ssh git

# Download nvidia-persistenced source code from github:
git clone https://github.com/NVIDIA/nvidia-persistenced.git

# Install nvidia-persistenced service daemon:
cd nvidia-persistenced/init
sudo ./install.sh

# Remove downloaded files:
cd ../.. && rm -rf nvidia-persistenced

# Check nvidia-persistence mode is ON:
nvidia-smi
# Or check nvidia-persistenced.service is running:
systemctl status nvidia-persistenced.service
```

:thumbsup: :sparkles:

## INSTALLATION COMPLETE

---

## [OPTIONAL] Install the NVIDIA GPU monitoring tool

### :star2::satellite: nvitop

```bash
# Install python3 and pip3 packages:
sudo apt-get install -y python3 python3-pip

# Install nvitop into system python3 packages:
sudo pip3 install nvitop

# Check nvitop:
nvitop -m full
```

- [https://pypi.org/project/nvitop](https://pypi.org/project/nvitop)
- [https://github.com/XuehaiPan/nvitop](https://github.com/XuehaiPan/nvitop)

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
cd ../.. && rm -rf nvtop

# Check nvtop:
nvtop
```

- [https://github.com/Syllo/nvtop](https://github.com/Syllo/nvtop)

---

## Re-install or upgrade the NVIDIA driver to the latest version

### Remove DKMS NVIDIA modules

**Skip this step, if you didn't install the NVIDIA driver with DKMS.**

```bash
# Check current dkms nvidia modules, versions, and kernels:
# [TIP]: Use module versions to remove.
dkms status | grep nvidia

# Remove old dkms nvidia module/version:
sudo dkms remove nvidia/[DRIVER_VERSION] --all
# For example:
sudo dkms remove nvidia/510.54 --all
```

### Disable the nvidia-persistenced service daemon

**Skip this step, if you didn't setup the nvidia-persistenced daemon.**

```bash
# Stop and disable nvidia-persistenced service daemon:
sudo systemctl stop nvidia-persistenced.service
sudo systemctl disable nvidia-persistenced.service
```

### Uninstall all nvidia-* packages

```bash
sudo apt-get remove --purge '^nvidia-.*'
# Or:
sudo nvidia-uninstall

# Reboot system:
sudo shutdown -r now
```

### Install the latest NVIDIA driver version

Install NVIDIA driver again (start from the beginning) - [#install-nvidia-gpu-driver](#install-nvidia-gpu-driver)
