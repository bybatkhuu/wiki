# NVM (Node Version Manager)

NVM is a tool for managing multiple versions of Node.js.

## Features

* Cross-platform
* Node.js
* Manager for multiple versions of Node.js, npm, and yarn
* Multiple Node.js environments

---

## Prerequisites

* **wget**: [https://linuxize.com/post/wget-command-examples](https://linuxize.com/post/wget-command-examples)

## Install on **Linux** or **macOS**

### 1. Download and install **NVM (v0.39.1)**

```bash
## Recommaned path to install NVM:
# Set and export `NVM_DIR` environment variable. For example:
mkdir -vp "${HOME}/workspaces/runtimes/.nvm"
export NVM_DIR="${HOME}/workspaces/runtimes/.nvm"

# Install NVM:
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

Check installed nvm version:

```bash
nvm --version
```

### 2. Install **Node.js**

```bash
nvm install --latest-npm --alias=default 16.13.2
nvm use default
nvm cache clear
npm cache clean --force
```

Check installed node.js and npm version:

```bash
node -v
npm -v
```

:sparkles: :+1:

## INSTALLATION COMPLETE

---

## Install on **Windows**

### 1. Download and install **NVM-Windows (v1.1.9)**

Downloads: [https://github.com/coreybutler/nvm-windows/releases](https://github.com/coreybutler/nvm-windows/releases)

### 2. Install **Node.js** (**Windows**)

```powershell
nvm install 16.13.2
nvm use 16.13.2
```

:sparkles: :+1:

## INSTALLATION COMPLETE (**Windows**)

---

## References

* NVM github: [https://github.com/nvm-sh/nvm](https://github.com/nvm-sh/nvm)
* Install NVM on Ubuntu 18.04: [https://nbanzyme.medium.com/easy-way-to-install-nvm-on-ubuntu-18-04-2cfb19ee5391](https://nbanzyme.medium.com/easy-way-to-install-nvm-on-ubuntu-18-04-2cfb19ee5391)
* Install NVM-Windows on Windows 10: [https://github.com/coreybutler/nvm-windows](https://github.com/coreybutler/nvm-windows)
* Install NVM macOS: [https://nodesource.com/blog/installing-node-js-tutorial-using-nvm-on-mac-os-x-and-ubuntu/](https://nodesource.com/blog/installing-node-js-tutorial-using-nvm-on-mac-os-x-and-ubuntu/)
