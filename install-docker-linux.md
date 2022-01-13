# Install Docker and Docker Compose on Linux

## Prerequisites

* **curl**: [https://www.cyberciti.biz/faq/how-to-install-curl-command-on-a-ubuntu-linux](https://www.cyberciti.biz/faq/how-to-install-curl-command-on-a-ubuntu-linux)

## 1. Install Docker

### 1.1. Install Docker with script

```bash
# Download docker installer script:
curl -fsSL https://get.docker.com -o get-docker.sh
# Install docker by 'get-docker.sh' script:
DRY_RUN=1 sudo sh get-docker.sh

## To avoid using 'sudo' for docker commands:
# Create new 'docker' group:
sudo groupadd docker
# Add current user to the 'docker' group:
sudo usermod -aG docker $(whoami)
# Apply new group changes to the new shell session:
newgrp docker

# Configure docker to start on reboot:
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Check docker is installed and running:
docker -v
docker info
docker images
```

### 1.2. [OPTIONAL] Install NVIDIA Docker (Only for NVIDIA GPU driver installed Linux)

* [REQUIRED] Install NVIDIA GPU driver: [https://github.com/bybatkhuu/wiki/blob/main/install-nvidia-driver-linux.md](https://github.com/bybatkhuu/wiki/blob/main/install-nvidia-driver-linux.md)
* For Ubuntu and Debian-based linux distros:

```bash
## [IMPORTANT] Only for Ubuntu and Debian-based linux
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
sudo vi /etc/docker/daemon.json
```

and add the following `default-runtime` to the `/etc/docker/daemon.json` file:

```json
    "default-runtime": "nvidia",
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

```bash
# Restart docker service:
sudo systemctl daemon-reload
sudo systemctl restart docker
```

## 2. [RECOMMENDED] Docker Post-installation

### 2.1. [RECOMMENDED] Limit docker log file max size and max rotation

Edit the `/etc/docker/daemon.json` file:

```bash
sudo vi /etc/docker/daemon.json
```

and add the following `log-opts` to the `/etc/docker/daemon.json` file:

```json
    "log-opts":
    {
        "max-size": "10m",
        "max-file": "5"
    },
```

```bash
# Restart docker service:
sudo service docker restart
```

### 2.2. [OPTIONAL] Change docker data directory to the external storage

```bash
# Stop the docker service:
sudo service docker stop
```

Edit the `/etc/docker/daemon.json` file:

```bash
sudo vi /etc/docker/daemon.json
```

and add the following `data-root` to the `/etc/docker/daemon.json` file and change it to the your new directory:

```json
   "data-root": "/mnt/new_storage/docker/data-root",
```

```bash
# Copy the current docker data directory to the new directory:
sudo rsync -aP /var/lib/docker/ /mnt/new_storage/docker/data-root
# Rename the old docker data directory as a backup:
sudo mv /var/lib/docker /var/lib/docker.old

# Start docker service:
sudo service docker start

# Test docker is working properly:
docker -v
docker info
docker images
docker ps -a

# Remove the old backup docker data directory:
sudo rm -rf /var/lib/docker.old
```

## 3. [RECOMMENDED] Install Docker Compose

```bash
# Download docker-compose binary release:
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permission to the docker-compose binary:
sudo chmod +x /usr/local/bin/docker-compose

# Create a symbolic link to '/usr/bin':
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Check docker-compose version:
docker-compose --version
```

:sparkles: :+1:

## INSTALLATION COMPLETE

---

## 4. [OPTIONAL] Install command auto-completion for docker-compose

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

* Docker supported platforms (OS): [https://docs.docker.com/engine/install](https://docs.docker.com/engine/install)
* Install docker (Ubuntu) - [https://docs.docker.com/engine/install/ubuntu](https://docs.docker.com/engine/install/ubuntu)
* Install docker with script - [https://github.com/docker/docker-install](https://github.com/docker/docker-install)
* Docker post-installation - [https://docs.docker.com/engine/install/linux-postinstall](https://docs.docker.com/engine/install/linux-postinstall)
* Install docker-compose - [https://docs.docker.com/compose/install/#install-compose-on-linux-systems](https://docs.docker.com/compose/install/#install-compose-on-linux-systems)
* Docker-compose github releases - [https://github.com/docker/compose/releases](https://github.com/docker/compose/releases)
* Install NVIDIA GPU driver - [https://bitbucket.org/ellexiinc/el_wiki/src/main/install-nvidia-driver-linux.md](https://bitbucket.org/ellexiinc/el_wiki/src/main/install-nvidia-driver-linux.md)
* NVIDIA docker for most linux distros - [https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)
