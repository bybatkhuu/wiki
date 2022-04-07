---
title: Install Docker and Docker Compose on Linux
description: This is a manual for installing Docker and Docker Compose on Linux
tags: 'docker, compose, linux, nvidiadocker'
cover_image: 'https://raw.githubusercontent.com/bybatkhuu/wiki/main/assets/images/docker.png'
canonical_url: null
published: true
---

## Official pages

- Install Docker Engine on Ubuntu: [https://docs.docker.com/engine/install/ubuntu/#installation-methods](https://docs.docker.com/engine/install/ubuntu/#installation-methods)
- Docker install script for most Linux distros: [https://github.com/docker/docker-install](https://github.com/docker/docker-install)
- NVIDIA Docker installation guide for most Linux distros: [https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#setting-up-nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#setting-up-nvidia-container-toolkit)
- Post-installation steps for Linux: [https://docs.docker.com/engine/install/linux-postinstall](https://docs.docker.com/engine/install/linux-postinstall)
- Install Docker Compose: [https://docs.docker.com/compose/install/#install-compose](https://docs.docker.com/compose/install/#install-compose)
- Docker Compose github releases: [https://github.com/docker/compose/releases](https://github.com/docker/compose/releases)
- Compose V2: [https://docs.docker.com/compose/cli-command/#install-on-linux](https://docs.docker.com/compose/cli-command/#install-on-linux)

---

## 1. Install Docker

### 1.1. Install Docker with the script

```bash
# Download docker installer script:
curl -fsSL https://get.docker.com -o get-docker.sh
# Install docker by 'get-docker.sh' script:
DRY_RUN=1 sudo sh get-docker.sh

# Remove downloaded script:
rm -vrf get-docker.sh

# To avoid using 'sudo' for docker commands:
# Create a new 'docker' group:
sudo groupadd docker
# Add current user to the 'docker' group:
sudo usermod -aG docker $(whoami)

# Apply new group changes to the new shell session:
newgrp docker
# Or reboot the system to apply docker group changes:
sudo shutdown -r now

# Configure docker to start on reboot:
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Check docker is installed and running:
docker -v
docker info
docker images
```

### 1.2. [Only for GPU] Install NVIDIA Docker

- Skip this step, if you don't have NVIDIA GPU!
- **[REQUIRED]** Install NVIDIA GPU driver: [https://github.com/bybatkhuu/wiki/blob/main/posts/manuals/installs/nvidia-driver-linux.md](https://github.com/bybatkhuu/wiki/blob/main/posts/manuals/installs/nvidia-driver-linux.md)
- For Ubuntu/Debian-based Linux distros:

```bash
## [IMPORTANT] Only for Ubuntu/Debian-based linux
# Download the nvidia-docker GPG key and setup the stable repository:
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

# Update repository list:
sudo apt-get update
# Install nvidia-docker2:
sudo apt-get install -y nvidia-docker2
```

Edit the `/etc/docker/daemon.json` file:

```bash
sudo nano /etc/docker/daemon.json
```

and add the following `default-runtime` into the `/etc/docker/daemon.json` file:

```json
{
    "default-runtime": "nvidia"
}
```

For example:

```json
{
    "default-runtime": "nvidia",
    "runtimes":
    {
        "nvidia":
        {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
```

save changes and exit from the file editor.

```bash
# Restart docker service:
sudo systemctl daemon-reload
sudo systemctl restart docker.service
```

### 2. [RECOMMENDED] Limit docker log file max size and max rotation

Edit the `/etc/docker/daemon.json` file:

```bash
sudo nano /etc/docker/daemon.json
```

and add the following `log-opts` into the `/etc/docker/daemon.json` file:

```json
{
    "log-opts":
    {
        "max-size": "10m",
        "max-file": "10"
    }
}
```

save changes and exit from the file editor.

```bash
# Restart docker service:
sudo systemctl restart docker.service
```

## 3. Install Docker Compose V2

```bash
## Download docker-compose binary release:
# [RECOMMENDED] Compose v2.2.3 (Linux) release:
sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-$(uname -m)" -o /usr/local/bin/docker-compose
# [For old version] Compose v1.29.2 (Linux) release:
# sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# [Only for experimental] Latest version release:
# sudo curl -L $(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url | grep linux-$(uname -m)\" | cut -d '"' -f 4) -o /usr/local/bin/docker-compose

# Apply executable permission to the docker-compose binary:
sudo chmod +x /usr/local/bin/docker-compose

# Create a symbolic link to '/usr/bin':
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Check docker-compose version:
docker-compose --version
```

:thumbsup: :sparkles:

## INSTALLATION COMPLETE

---

## [OPTIONAL] Change the docker data directory to the external storage

```bash
# Stop the docker service:
sudo systemctl stop docker.service
```

Edit the `/etc/docker/daemon.json` file:

```bash
sudo nano /etc/docker/daemon.json
```

and add the following `data-root` into the `/etc/docker/daemon.json` file (don't forget to change **[NEW_STORAGE_PATH]** to your new directory):

```json
{
   "data-root": "[NEW_STORAGE_PATH]/docker/data-root"
}
```

For example:

```json
{
   "data-root": "/mnt/ssd/1/docker/data-root"
}
```

save changes and exit from the file editor.

```bash
# Copy the current docker data directory to the new directory:
sudo rsync -a /var/lib/docker/ [NEW_STORAGE_PATH]/docker/data-root
# For example:
sudo rsync -a /var/lib/docker/ /mnt/ssd/1/docker/data-root

# Rename the old docker data directory as a backup:
sudo mv /var/lib/docker /var/lib/docker.old

# Start docker service:
sudo systemctl start docker.service

# Test docker is working properly:
docker -v
docker info
docker images
docker ps -a

# Remove the old backup docker data directory:
sudo rm -rf /var/lib/docker.old
```

## [OPTIONAL] Install command auto-completion for docker-compose

```bash
# Download docker-compose auto-completion script into '/etc/bash_completion.d/':
sudo curl \
    -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/bash/docker-compose \
    -o /etc/bash_completion.d/docker-compose

# Reload current bash shell session:
source ~/.bashrc
```

---

## References

- Docker supported platforms (OS): [https://docs.docker.com/engine/install](https://docs.docker.com/engine/install)
- Install NVIDIA GPU driver: [https://github.com/bybatkhuu/wiki/blob/main/posts/manuals/installs/nvidia-driver-linux.md](https://github.com/bybatkhuu/wiki/blob/main/posts/manuals/installs/nvidia-driver-linux.md)
- Change docker data root directory: [https://tienbm90.medium.com/how-to-change-docker-root-data-directory-89a39be1a70b](https://tienbm90.medium.com/how-to-change-docker-root-data-directory-89a39be1a70b)
