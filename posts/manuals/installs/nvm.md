---
title: Install NVM (Node Version Manager) and Node.js
description: This is a manual for installing NVM and Node.js
tags: 'nvm, node, javascript, crossplatform'
cover_image: 'https://raw.githubusercontent.com/bybatkhuu/wiki/main/assets/images/nvm.png'
canonical_url: null
published: true
id: 1047409
date: '2022-04-07T08:27:46Z'
---

## NVM (Node Version Manager)

NVM is a tool for managing multiple versions of Node.js.

### Features

- Cross-platform
- Node.js
- Manager for multiple versions of Node.js, npm, and yarn
- Multiple Node.js environments

## Official pages

- NVM: [https://github.com/nvm-sh/nvm](https://github.com/nvm-sh/nvm)
- NVM for Windows: [https://github.com/coreybutler/nvm-windows](https://github.com/coreybutler/nvm-windows)

---

## Install on **Linux** or **macOS**

### 1. Download and install **NVM (v0.39.1)**

```sh
## Recommended path to install NVM:
# Set and export `NVM_DIR` environment variable. For example:
mkdir -vp ~/workspaces/runtimes/.nvm
export NVM_DIR="${HOME}/workspaces/runtimes/.nvm"

# Install NVM:
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash


## For bash:
# Load .bashrc file to init NVM into current bash session:
source ~/.bashrc

## For zsh:
# Load .zshrc file to init NVM into current zsh session:
source ~/.zshrc


# Check installed NVM version:
nvm --version
```

### 2. Install **Node.js**

```sh
# Install Node.js, update NPM to latest, and set default Node.js:
nvm install --latest-npm --alias=default 16.14.2
# Set to use default Node.js:
nvm use default

# Clean NVM caches:
nvm cache clear

# Check installed Node.js and NPM version:
node -v
npm -v

# Install essential extra packages:
npm install -g pm2 newman jshint
pm2 install pm2-logrotate

# Clean NPM caches:
npm cache clean --force
```

:thumbsup: :sparkles:

## INSTALLATION COMPLETE (**Linux**, **macOS**)

---

## Install on **Windows**

### 1. Download and install **NVM-Windows (v1.1.9)**

- Downloads: [https://github.com/coreybutler/nvm-windows/releases](https://github.com/coreybutler/nvm-windows/releases)

### 2. Install **Node.js** (**Windows**)

```powershell
nvm install 16.14.2
nvm use 16.14.2
```

:thumbsup: :sparkles:

## INSTALLATION COMPLETE (**Windows**)

---

## Usage

```sh
# NVM help:
nvm -h
```

---

## References

- Install NVM on Ubuntu 18.04: [https://nbanzyme.medium.com/easy-way-to-install-nvm-on-ubuntu-18-04-2cfb19ee5391](https://nbanzyme.medium.com/easy-way-to-install-nvm-on-ubuntu-18-04-2cfb19ee5391)
- Install NVM macOS: [https://nodesource.com/blog/installing-node-js-tutorial-using-nvm-on-mac-os-x-and-ubuntu/](https://nodesource.com/blog/installing-node-js-tutorial-using-nvm-on-mac-os-x-and-ubuntu/)
