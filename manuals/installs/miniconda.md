# Miniconda (Conda)

The clean and light version of the anaconda.

## Features

- Cross-platform
- Python
- Conda
- Miniforge
- Multiple environments

## Official pages

- Miniconda: [https://docs.conda.io/en/latest/miniconda.html](https://docs.conda.io/en/latest/miniconda.html)
- Install on Linux: [https://conda.io/projects/conda/en/latest/user-guide/install/linux.html](https://conda.io/projects/conda/en/latest/user-guide/install/linux.html)
- Miniforge: [https://github.com/conda-forge/miniforge](https://github.com/conda-forge/miniforge)

---

## Install on **Linux**, **macOS**, or **Windows**

### 1. Download and install **Miniconda (v3)**

- For **Windows**: [https://docs.conda.io/en/latest/miniconda.html](https://docs.conda.io/en/latest/miniconda.html)
- For **Linux** or **macOS**:

```sh
## Recommended path to install Miniconda:
# For example: ${HOME}/workspaces/runtimes/miniconda3

## Linux (x86_64):
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.11.0-Linux-x86_64.sh
bash Miniconda3-py38_4.11.0-Linux-x86_64.sh

## Linux (aarch64):
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh
bash Miniforge3-Linux-aarch64.sh

## macOS (Intel):
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.11.0-MacOSX-x86_64.sh
bash Miniconda3-py38_4.11.0-MacOSX-x86_64.sh

## macOS (Apple M1):
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh
bash Miniforge3-MacOSX-arm64.sh


# Remove downloaded file:
rm -vrf Mini*.sh

# For bash:
# Load .bashrc file to init conda into current bash session:
source ~/.bashrc

# For zsh:
# Load .zshrc file to init conda into current zsh session:
source ~/.zshrc


# Clean conda caches:
conda clean -y -av

# Update conda to the latest version:
conda update -y conda

# Check installed conda version:
conda -V
```

### 2. Install **Python**

```sh
# Create a new conda environment with python and pip:
conda create -y -n py38 python=3.8.12 pip

# Set default conda environment to .bashrc:
## Linux:
echo "conda activate py38" >> ~/.bashrc

## macOS:
echo "conda activate py38" >> ~/.zshrc

# Activate new conda environment:
conda activate py38

# Upgrade pip to the latest version:
pip install -U pip
pip install pytest

# Clean pip caches:
pip cache purge

# Clean conda caches:
conda clean -y -av

# Check installed python and pip version:
python -V
pip -V
```

:thumbsup: :sparkles:

## INSTALLATION COMPLETE

---

## Command usage

```sh
## Viewing a list of the packages in a conda environment:
conda list

# Or list packages of other conda environment:
conda list -n py38


## Viewing a list of conda environments:
conda env list


## Creating environment variables associated with Conda environments:
conda env config vars set PYTHONPATH="${PWD}:${PYTHONPATH}"


## Exporting conda environment to environment.yml file:
conda env export > environment.yml


## Creating conda environment from environment.yml file:
conda env create -f environment.yml


## Cloning a conda environment:
conda create -y -n py38_clone --clone py38


## Removing conda environment:
conda remove -y -n py38 --all


## Conda help:
conda -h
```

Conda help:

```txt
usage: conda [-h] [-V] command ...

conda is a tool for managing and deploying applications, environments and packages.

Options:

positional arguments:
  command
    clean        Remove unused packages and caches.
    compare      Compare packages between conda environments.
    config       Modify configuration values in .condarc. This is modeled after the git config command. Writes to the user .condarc file (/Users/batkhuu/.condarc) by default.
    create       Create a new conda environment from a list of specified packages.
    help         Displays a list of available conda commands and their help strings.
    info         Display information about current conda install.
    init         Initialize conda for shell interaction. [Experimental]
    install      Installs a list of packages into a specified conda environment.
    list         List linked packages in a conda environment.
    package      Low-level conda package utility. (EXPERIMENTAL)
    remove       Remove a list of packages from a specified conda environment.
    uninstall    Alias for conda remove.
    run          Run an executable in a conda environment.
    search       Search for packages and display associated information. The input is a MatchSpec, a query language for conda packages. See examples below.
    update       Updates conda packages to the latest compatible version.
    upgrade      Alias for conda update.

optional arguments:
  -h, --help     Show this help message and exit.
  -V, --version  Show the conda version number and exit.

conda commands available from other packages:
  env
```

---

## References

- Miniconda installation: [https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html)
- Managing conda environments: [https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
