# Publish Python Package to PyPI

## Official pages

* Python setup.py - [https://docs.python.org/3/distutils/setupscript.html](https://docs.python.org/3/distutils/setupscript.html)
* Setuptools:
    * [https://setuptools.pypa.io/en/latest/userguide/quickstart.html](https://setuptools.pypa.io/en/latest/userguide/quickstart.html)
    * [https://pypi.org/project/setuptools](https://pypi.org/project/setuptools)
* Wheel - [https://pypi.org/project/wheel](https://pypi.org/project/wheel)
* Twine - [https://pypi.org/project/twine](https://pypi.org/project/twine)
* Real Python - [https://realpython.com/pypi-publish-python-package](https://realpython.com/pypi-publish-python-package)

---

## Getting started

### 1. Prerequisites

* **Python (>= v3.7.11)**
    * **[RECOMMENDED] Miniconda (v3)**: [https://github.com/bybatkhuu/wiki/blob/main/posts/manuals/installs/miniconda.md](https://github.com/bybatkhuu/wiki/blob/main/posts/manuals/installs/miniconda.md)
* **Pip (>= v20)**

### 2. Install required packages

```sh
pip install --upgrade pip setuptools wheel twine
```

### 3. Create a new Python package

**Required** folders/files:

* **my_package/**
* **LICENSE.txt**
* README.md
* **setup.cfg**
* **setup.py**

Folder **tree**:

```txt
my_package/
│
├── my_package/
│   ├── __init__.py
│   ├── __version__.py
│   └── my_package.py
│
├── tests/
│   ├── __init__.py
│   └── test_my_package.py
│
├── __init__.py
├── LICENSE.txt
├── README.md
├── sample.py
├── setup.cfg
└── setup.py
```

**LICENSE.txt**:

```txt
MIT License
Copyright (c) 2022 Firstname Lastname
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

**setup.cfg**:

```cfg
[metadata]
description_file = README.md
```

**setup.py**:

```python
# -*- coding: utf-8 -*-

from setuptools import setup
from distutils.util import convert_path


_package_name = 'my_package'

_namespace_dict = {}
_version_path = convert_path(f'{_package_name}/__version__.py')
with open(_version_path) as _version_file:
    exec(_version_file.read(), _namespace_dict)
_package_version = _namespace_dict['__version__']

setup(
    name = _package_name,
    packages = [_package_name],
    version = f"{_package_version}",
    license='MIT',
    description = 'Package description.',
    long_description = open('README.md', 'r').read(),
    long_description_content_type='text/markdown',
    author = 'Fistname Lastname',
    author_email = 'user@email.com',
    url = 'https://github.com/username/my_package/',
    download_url = f'https://github.com/username/my_package/get/release-{_package_version}.tar.gz',
    keywords = [_package_name, 'test', 'dummy', 'package'],
    install_requires = [
            'python-dotenv>=0.19.0',
            'PyYAML>=5.4.1'
        ],
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'Topic :: Software Development :: Build Tools',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.9',
        'Programming Language :: Python :: 3.10'
    ],
)
```

### 4. Build and test the package

```sh
# Unittest:
python -m unittest tests/test_*.py
# Or pytest:
pytest

# Build package:
python setup.py sdist bdist_wheel

# Check built files:
ls -lh dist/
```

### 5. Upload package to PyPI

```sh
# Check package before upload:
twine check dist/*

# Upload package (Login with PyPI account):
twine upload dist/*

# Cleanup built files:
rm -vrf dist/ build/ my_package.egg-info/
```

### 6. Install package from PyPI

```sh
# Install package:
pip install my_package

# Test:
python -c "import my_packge; print(my_packge.__version__);"
```

:sparkles:

## DONE

---

## Manually install pip

```sh
# Download get-pip.py:
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

# Install pip:
python get-pip.py

# Check pip:
pip -V

# Cleanup:
rm -vf get-pip.py
```

## Python setup.py

```sh
python setup.py --help-commands
```

```txt
Standard commands:
  build             build everything needed to install
  build_py          "build" pure Python modules (copy to build directory)
  build_ext         build C/C++ extensions (compile/link to build directory)
  build_clib        build C/C++ libraries used by Python extensions
  build_scripts     "build" scripts (copy and fixup #! line)
  clean             clean up temporary files from 'build' command
  install           install everything from build directory
  install_lib       install all Python modules (extensions and pure Python)
  install_headers   install C/C++ header files
  install_scripts   install scripts (Python or otherwise)
  install_data      install data files
  sdist             create a source distribution (tarball, zip file, etc.)
  register          register the distribution with the Python package index
  bdist             create a built (binary) distribution
  bdist_dumb        create a "dumb" built distribution
  bdist_rpm         create an RPM distribution
  bdist_wininst     create an executable installer for MS Windows
  check             perform some checks on the package
  upload            upload binary package to PyPI

Extra commands:
  alias             define a shortcut to invoke one or more commands
  bdist_egg         create an "egg" distribution
  develop           install package in 'development mode'
  dist_info         create a .dist-info directory
  easy_install      Find/get/install Python packages
  egg_info          create a distribution's .egg-info directory
  install_egg_info  Install an .egg-info directory for the package
  rotate            delete older distributions, keeping N newest files
  saveopts          save supplied options to setup.cfg or other config file
  setopt            set an option in setup.cfg or another config file
  test              run unit tests after in-place build (deprecated)
  upload_docs       Upload documentation to sites other than PyPi such as devpi
  bdist_wheel       create a wheel distribution

usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
   or: setup.py --help [cmd1 cmd2 ...]
   or: setup.py --help-commands
   or: setup.py cmd --help
```

---

## References

* [https://setuptools.pypa.io/en/latest](https://setuptools.pypa.io/en/latest)
* [https://github.com/pypa/setuptools](https://github.com/pypa/setuptools)
* [https://wheel.readthedocs.io/en/stable](https://wheel.readthedocs.io/en/stable)
* [https://github.com/pypa/wheel](https://github.com/pypa/wheel)
* [https://twine.readthedocs.io/en/stable](https://twine.readthedocs.io/en/stable)
* [https://github.com/pypa/twine](https://github.com/pypa/twine)
* [https://towardsdatascience.com/how-to-upload-your-python-package-to-pypi-de1b363a1b3](https://towardsdatascience.com/how-to-upload-your-python-package-to-pypi-de1b363a1b3)
* [https://medium.com/@joel.barmettler/how-to-upload-your-python-package-to-pypi-65edc5fe9c56](https://medium.com/@joel.barmettler/how-to-upload-your-python-package-to-pypi-65edc5fe9c56)
