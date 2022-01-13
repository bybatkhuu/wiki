# Miniconda (Conda)

The clean and light version of anaconda.

## Features

* Cross-platform
* Python
* Conda
* Miniforge
* Multiple environments

---

## Prerequisites

* **wget**: [https://linuxize.com/post/wget-command-examples](https://linuxize.com/post/wget-command-examples)

## Installing on **Linux**, **macOS**, or **Windows**

### 1. Download and install **Miniconda (v3)**

```bash
## Recommaned path to install Miniconda:
# For example: "${HOME}/workspaces/runtimes/miniconda3"

## Linux (x86_64):
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh
bash Miniconda3-py38_4.10.3-Linux-x86_64.sh

## Linux (aarch64):
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-aarch64.sh
bash Miniconda3-py38_4.10.3-Linux-aarch64.sh

## macOS (Intel):
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-MacOSX-x86_64.sh
bash Miniconda3-py38_4.10.3-MacOSX-x86_64.sh

## macOS (Apple M1):
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh
bash Miniforge3-MacOSX-arm64.sh
```

For **Windows**: [https://docs.conda.io/en/latest/miniconda.html](https://docs.conda.io/en/latest/miniconda.html)

Removing unuseful packages, caches, temp files, and updating conda to the latest version:

```sh
conda clean -y -av
conda update -y conda
```

Check installed conda version:

```sh
conda --version
```

### 2. Install **Python**

```sh
conda create -y -n py38 python=3.8.12 pip

## Linux:
echo "conda activate py38" >> ~/.bashrc

## macOS:
echo "conda activate py38" >> ~/.zshrc

conda activate py38
pip install -U pip
pip cache purge

conda clean -y -av
```

Check installed python and pip version:

```sh
python -V
pip -V
```

:sparkles: :+1:

## INSTALLATION COMPLETE

---

## Additionals

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

* [https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html)
* [https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
* [https://docs.conda.io/en/latest/miniconda.html](https://docs.conda.io/en/latest/miniconda.html)
* [https://github.com/conda-forge/miniforge](https://github.com/conda-forge/miniforge)
