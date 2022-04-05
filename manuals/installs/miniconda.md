# Miniconda (Conda)

The clean and light version of the anaconda.

## Features

* Cross-platform
* Python
* Conda
* Miniforge
* Multiple environments

## Official pages

* Miniconda - [https://docs.conda.io/en/latest/miniconda.html](https://docs.conda.io/en/latest/miniconda.html)
* Install on Linux - [https://conda.io/projects/conda/en/latest/user-guide/install/linux.html](https://conda.io/projects/conda/en/latest/user-guide/install/linux.html)
* Miniforge - [https://github.com/conda-forge/miniforge](https://github.com/conda-forge/miniforge)

---

## Install on **Linux**, **macOS**, or **Windows**

### 1. Download and install **Miniconda (v3)**

* For **Windows**: [https://docs.conda.io/en/latest/miniconda.html](https://docs.conda.io/en/latest/miniconda.html)
* For **Linux** or **macOS**:

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

:sparkles:

## INSTALLATION COMPLETE

---

## Usage

### Viewing a list of the packages in a conda environment

```sh
conda list

# Or list packages of other conda environment:
conda list -n py38
```

### Viewing a list of conda environments

```sh
conda env list
```

### Creating environment variables associated with Conda environments

```sh
conda env config vars set PYTHONPATH="${PWD}:${PYTHONPATH}"
```

### Exporting conda environment to environment.yml

```sh
conda env export > environment.yml
```

### Creating conda environment from environment.yml file

```sh
conda env create -f environment.yml
```

### Cloning a conda environment

```sh
conda create -y -n py38_clone --clone py38
```

### Removing conda environment

```sh
conda remove -y -n py38 --all
```

---

## References

* Miniconda installation - [https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html)
* Managing conda environments - [https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
