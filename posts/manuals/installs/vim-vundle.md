# Vim Vundle

Vundle is short for Vim bundle and is a Vim plugin manager.

## Official pages

* Vim - [https://www.vim.org](https://www.vim.org)
* Vundle - [https://github.com/VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)
* Vim plugins - [https://vimawesome.com](https://vimawesome.com)

---

## Installation

### 1. Install Vim

#### a. Install on **Linux**

For **Ubuntu/Debian** OS:

```bash
sudo apt-get update
sudo apt-get install -y vim git
```

For **Alpine** OS:

```bash
sudo apk add --update vim git
```

#### b. Install on **macOS**

```zsh
brew install vim
```

#### c. Install on **Windows**

* Download and install: [https://www.vim.org/download.php](https://www.vim.org/download.php)
* Or install WSL2 to use vim.

### 2. Donwload Vundle

```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### 3. Configure .vimrc

* **TIP!**: If youn don't know about vim configuration, use sample **.vimrc** file - [https://github.com/bybatkhuu/wiki/blob/main/assets/samples/.vimrc](https://github.com/bybatkhuu/wiki/blob/main/assets/samples/.vimrc)

Edit the `~/.vimrc` file:

```sh
nano ~/.vimrc
```

and put following at the top of your `.vimrc` to use Vundle. Remove plugins you don't need, they are for illustration purposes.:

```sh
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
```

### 4. Install plugins

To install from command line:

```sh
vim +PluginInstall +qall
```

Or launch vim and run `:PluginInstall`:

```sh
vim

# :PluginInstall
```

:thumbsup: :sparkles:

## INSTALLATION COMPLETE

---

## References

* [https://www.tabnine.com/blog/top-vim-plugins](https://www.tabnine.com/blog/top-vim-plugins)
* [https://linuxhint.com/installing_vim_vundle_plugin_ubuntu](https://linuxhint.com/installing_vim_vundle_plugin_ubuntu)
