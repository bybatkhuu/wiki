# Oh My Zsh

## Official pages

* Zsh - [https://www.zsh.org](https://www.zsh.org)
* Oh My Zsh - [https://ohmyz.sh](https://ohmyz.sh)
* Nerd Fonts - [https://www.nerdfonts.com](https://www.nerdfonts.com)
* Powerlevel10k - [https://github.com/romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k)
* ZSH-autosuggestions - [https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
* ZSH-syntax-highlighting - [https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)

---

## Installation

### 1. Install **ZSH**

* **TIP!**: If you already installed Zsh, you can skip this step.

#### a. Install on **Linux**

For **Ubuntu/Debian** OS:

```bash
sudo apt-get update
sudo apt-get install -y zsh wget curl git
```

For **Alpine** OS:

```bash
sudo apk add --update zsh wget curl git
```

#### b. Install  on **macOS**

Zsh is the default shell for macOS.

#### c. Install on **Windows**

Install WSL2 to use Zsh.

### 2. Install and configure **Oh My Zsh**

#### 2.1. Install Oh My Zsh

* **TIP!**: If you already installed Oh My Zsh, you can skip this step.
* **TIP!**: (Linux only) I recommend, don't make zsh to default shell, but it's up to you.

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### 2.2. Configure .zshrc file

##### Disable some options to make it faster

Edit the `~/.zshrc` file:

```sh
nano ~/.zshrc
```

and add the following lines into the `~/.zshrc` file:

```zsh
# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

ZSH_DISABLE_COMPFIX=true
```

##### Add some aliases to make it comfortable

Edit the `~/.zshrc` file:

```sh
nano ~/.zshrc
```

and add the following lines into the `~/.zshrc` file:

**Linux** only:

```sh
alias ls='ls -ahF --group-directories-first --color=auto'
alias ll='ls -alhF --group-directories-first --color=auto'
```

**macOS** only:

```sh
alias ls='gls -aF --group-directories-first --color=auto'
alias ll='gls -alhF --group-directories-first --color=auto'
```

### 3. Install Oh My Zsh plugins

#### 3.1. Install **ZSH-autosuggestions** and **ZSH-syntax-highlighting**

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Edit the `~/.zshrc` file:

```sh
nano ~/.zshrc
```

and add the following `zsh-autosuggestions` and `zsh-syntax-highlighting` plugins into the `plugins` list for Oh My Zsh:

```sh
plugins=([OTHER-PLUGINS...] zsh-autosuggestions zsh-syntax-highlighting)
# For example:
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

#### 3.2. Recommended plugins

* **TIP!**: To use **NVM** in zsh, `nvm` plugin is required.

Edit the `~/.zshrc` file:

```sh
nano ~/.zshrc
```

and add the following plugins into the `plugins` list for Oh My Zsh:

```sh
plugins=([OTHER-PLUGINS...] docker docker-compose python pip nvm node npm)
# For example:
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose python pip nvm node npm)
```

### 4. Install **Powerlevel10k**

#### 4.1. Install Nerd Fonts

Download and install Nerd Fonts:

* [https://www.nerdfonts.com](https://www.nerdfonts.com)
* [https://github.com/ryanoasis/nerd-fonts#font-installation](https://github.com/ryanoasis/nerd-fonts#font-installation)
* [https://github.com/romkatv/powerlevel10k#manual-font-installation](https://github.com/romkatv/powerlevel10k#manual-font-installation)

and change the font of terminal or editor to the Nerd Fonts!

#### 4.2. Install Powerlevel10k

```sh
# Download Powerlevel10k for Oh My Zsh:
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Edit the `~/.zshrc` file:

```sh
nano ~/.zshrc
```

and change the following `ZSH_THEME` to the `powerlevel10k/powerlevel10k`:

```sh
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Configure powerlevel10k:

```sh
# Type 'p10k configure' if the configuration wizard doesn't start automatically:
p10k configure
```

:sparkles:

## INSTALLATION COMPLETE

---

## EXTRA TIPS

### Add conda into zsh (Linux only)

```sh
# Change back to bash shell:
exit

# Init conda for zsh:
conda init zsh

# Enter into zsh shell:
zsh

# Check conda command is working:
conda -V
conda env list
```

### [RECOMMENDED] Change default shell to bash (Linux only)

```sh
chsh -s /bin/bash
```

### Sample .zshrc file

* .zshrc - [https://github.com/bybatkhuu/wiki/blob/main/samples/.zshrc](https://github.com/bybatkhuu/wiki/blob/main/samples/.zshrc)

---

## References

* [https://drasite.com/blog/Pimp%20my%20terminal](https://drasite.com/blog/Pimp%20my%20terminal)
* [https://sourabhbajaj.com/mac-setup/iTerm/zsh.html](https://sourabhbajaj.com/mac-setup/iTerm/zsh.html)
* [https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156](https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156)
