# Install NVIDIA CUDA on Linux

## Official pages

* CUDA - [https://developer.nvidia.com/cuda-toolkit](https://developer.nvidia.com/cuda-toolkit)
* CUDA archive - [https://developer.nvidia.com/cuda-toolkit-archive](https://developer.nvidia.com/cuda-toolkit-archive)
* Install CUDA - [https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#runfile](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#runfile)
* cuDNN - [https://developer.nvidia.com/cudnn](https://developer.nvidia.com/cudnn)
* Install cuDNN - [https://docs.nvidia.com/deeplearning/cudnn/install-guide/index.html#installlinux-tar](https://docs.nvidia.com/deeplearning/cudnn/install-guide/index.html#installlinux-tar)
* TensorRT - [https://developer.nvidia.com/tensorrt-getting-started](https://developer.nvidia.com/tensorrt-getting-started)
* Install TensorRT - [https://docs.nvidia.com/deeplearning/tensorrt/install-guide/index.html#installing-tar](https://docs.nvidia.com/deeplearning/tensorrt/install-guide/index.html#installing-tar)

---

## Prerequisites

### Check current Linux system specification

* Check NVIDIA GPU exists:

```bash
## Use lshw:
lshw -C display

# Only for Ubuntu/Debian:
sudo apt-get update --fix-missing -o Acquire::CompressionTypes::Order::=gz
sudo apt-get install -y pciutils mesa-utils
# Or use lspci:
lspci | grep -i vga && lspci | grep -i nvidia
# Or use glxinfo:
glxinfo | egrep "OpenGL vendor|OpenGL renderer"
```

* Check linux OS information:

```bash
## Check linux OS version and distro:
uname -a && cat /etc/*release

## Check kernel version:
uname -r
# Or:
hostnamectl

## Check GCC and make compiler version:
gcc --version && make -v

## Check glibc version:
ldd --version
```

### Check CUDA version compatibility

* **[IMPORTANT]** Search and check the **latest stable NVIDIA driver version** for **your GPU model(s)**:
    * NVIDIA driver downloads - [https://www.nvidia.com/Download/Find.aspx?lang=en-us](https://www.nvidia.com/Download/Find.aspx?lang=en-us)
* **[IMPORTANT]** Check the **compatibility** of the **NVIDIA driver version** with **CUDA versions**:
    * CUDA release note -[https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html](https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html)
    * CUDA compatibility PDF - [https://docs.nvidia.com/pdf/CUDA_Compatibility.pdf](https://docs.nvidia.com/pdf/CUDA_Compatibility.pdf)
    * CUDA compatibility - [https://docs.nvidia.com/deploy/cuda-compatibility/#minor-version-compatibility](https://docs.nvidia.com/deploy/cuda-compatibility/#minor-version-compatibility)
* **[IMPORTANT]** Check **system requirements** for **CUDA versions**:
    * CUDA latest version - [https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#system-requirements](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#system-requirements)
    * CUDA older versions archive - [https://developer.nvidia.com/cuda-toolkit-archive](https://developer.nvidia.com/cuda-toolkit-archive)
* **[RECOMMENDED]** Check the **compute capability** of **your GPU model(s)**:
    * GPU compute capability - [https://developer.nvidia.com/cuda-gpus](https://developer.nvidia.com/cuda-gpus)
    * CUDA wikipedia - [https://en.wikipedia.org/wiki/CUDA](https://en.wikipedia.org/wiki/CUDA)
* **[RECOMMENDED]** Check the **cuDNN version** with **compute capability** of **your GPU model(s)**:
    * cuDNN support matrix - [https://docs.nvidia.com/deeplearning/cudnn/support-matrix/index.html](https://docs.nvidia.com/deeplearning/cudnn/support-matrix/index.html)
* *[OPTIONAL]* Check the **compatibility** of **TensorRT versions** with **CUDA versions** and **cuDNN versions**:
    * TensorRT latest version - [https://docs.nvidia.com/deeplearning/tensorrt/support-matrix/index.html](https://docs.nvidia.com/deeplearning/tensorrt/support-matrix/index.html)
    * TensorRT older versions archives - [https://docs.nvidia.com/deeplearning/tensorrt/archives/index.html](https://docs.nvidia.com/deeplearning/tensorrt/archives/index.html)
* **[RECOMMENDED]** Check compatible **CUDA versions** for required **machine learning/deep learning frameworks/libraries** you want to use:
    * Tensorflow-gpu - [https://www.tensorflow.org/install/source#gpu](https://www.tensorflow.org/install/source#gpu)
    * Pytorch - [https://pytorch.org/get-started/previous-versions](https://pytorch.org/get-started/previous-versions)
    * Etc...

### Install NVIDIA GPU driver

* **[IMPORTANT]** Install NVIDIA GPU Driver - [https://github.com/bybatkhuu/wiki/blob/main/manuals/installs/nvidia-driver-linux.md](https://github.com/bybatkhuu/wiki/blob/main/manuals/installs/nvidia-driver-linux.md)

## Install CUDA toolkit

### Download CUDA

* **IMPORTANT!** **Download and use the .RUN file!** It can **prevent installing incompatible NVIDIA drivers** and **prevent overwriting** the previous **/usr/local/cuda** (if you installed another CUDA already) symbolic link.
* **IMPORTANT!** **Don't download or use the .DEB file!** It will **overwrite the current default CUDA (if you installed it already) directory (/usr/local/cuda)** and also it will **overwrite the already installed latest compatible NVIDIA driver version** into the **old or incompatible driver**. Moreover, if you **want to use a different version of CUDA, never install CUDA.DEB file!**
* Search and download the required version of CUDA (**cuda_\*\*\*_linux.run**) installer file from this link: [https://developer.nvidia.com/cuda-toolkit-archive](https://developer.nvidia.com/cuda-toolkit-archive)
* If you're using a command-line interface, just copy the download link from the NVIDIA website and use wget to download. For example:

```bash
mkdir -v ~/Downloads
cd ~/Downloads
# 1. (Skip this, if you've already downloaded) Download CUDA .run installer file by wget:
wget https://developer.download.nvidia.com/compute/cuda/[CUDA_VERSION]/local_installers/cuda_[CUDA_VERSION]_[DRIVER_VERSION]_linux.run
# For example:
wget https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/cuda_11.0.3_450.51.06_linux.run
```

### Install CUDA.run file

When installing CUDA.run, follow the below steps:

* Type '**accept**' and **ENTER**.
* **IMPORTANT!** Uncheck and disable NVIDIA driver installation to prevent overwriting already installed latest compatible version of NVIDIA driver into an old or incompatible driver.
* **IMPORTANT!** Uncheck and disable CUDA symbolic link installation to prevent overwriting the current default CUDA (if you installed it already) directory (/usr/local/cuda).
* Choose install and press it!

```bash
# Change directory to cuda_***.run file downloaded directory. For example:
cd ~/Downloads

# 2. IMPORTANT! Install cuda_***.run file:
sudo sh cuda_[CUDA_VERSION]_[DRIVER_VERSION]_linux.run
# For example:
sudo sh cuda_11.0.3_450.51.06_linux.run

# 3. Remove downloaded file:
rm -vrf cuda_[CUDA_VERSION]_[DRIVER_VERSION]_linux.run
# For example:
rm -vrf cuda_11.0.3_450.51.06_linux.run
```

## Post-installation

Edit the `~/.bashrc` file:

```bash
# 4. Add CUDA environment variables to current user .bashrc file:
# (It loads environment variables, whenever current user opens a new bash session/new terminal)
nano ~/.bashrc
```

and add the following lines into the `~/.bashrc` file (don't forget to change **CUDA_VERSION** into the installed version):

```bash
## CUDA ##
# Change to installed CUDA version:
# export CUDA_VERSION=[CUDA_VERSION]
export CUDA_VERSION=11.0
export CUDA_HOME="/usr/local/cuda-${CUDA_VERSION}"
export CUDA_PATH="${CUDA_HOME}"
export PATH="${CUDA_PATH}/bin:${PATH}"
export LIBRARY_PATH="${CUDA_PATH}/lib64:${LIBRARY_PATH}"
export LD_LIBRARY_PATH="${CUDA_PATH}/lib64:${LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH="${CUDA_PATH}/extras/CUPTI/lib64:${LD_LIBRARY_PATH}"
export NVCC="${CUDA_PATH}/bin/nvcc"
export CFLAGS="-I${CUDA_PATH}/include ${CFLAGS}"
```

```bash
# 5. Load .bashrc file to init environment variables into the current bash session:
source ~/.bashrc

# 6. Check CUDA compiler version:
nvcc -V
# Or:
cat ${CUDA_PATH}/version.txt
# Or:
cat ${CUDA_PATH}/version.json
```

## [RECOMMENDED] Install cuDNN (For Deep Learning)

### Download cuDNN

* **IMPORTANT!** **Download and use .TGZ or .TAR.XZ file!** You can install cuDNN into a custom directory, which means you can control which version of cuDNN you want to use and where to install it.
* **IMPORTANT!** **Don't download and use .DEB file!** It will overwrite the cuDNN library into the current default CUDA directory (/usr/local/cuda).
* Download cuDNN **.TGZ** or **.TAR.XZ** file from this link: [https://developer.nvidia.com/rdp/cudnn-download](https://developer.nvidia.com/rdp/cudnn-download)

### Install cuDNN .tgz or .tar.xz package files

```bash
# Change directory to cudnn_***.tgz or .tar.xz file downloaded directory. For example:
cd ~/Downloads

## Extract cuDNN .tgz or .tar.xz package file:
# New versions:
tar -xf cudnn-linux-x86_64-[CUDNN_VERSION]_cuda[CUDA_VERSION]-archive.tar.xz
# For example:
tar -xf cudnn-linux-x86_64-8.3.1.22_cuda11.5-archive.tar.xz

# Or older versions:
tar -xzf cudnn-[CUDA_VERSION]-linux-x64-v[CUDNN_VERSION].tgz
# For example:
tar -xzf cudnn-11.0-linux-x64-v8.0.5.39.tgz


# Copy extracted files into specific CUDA directory:
sudo cp -v cud*/include/cudnn*.h /usr/local/cuda-${CUDA_VERSION}/include
sudo cp -v cud*/lib*/libcudnn* /usr/local/cuda-${CUDA_VERSION}/lib64

# Add read permissions to extracted files:
sudo chmod a+r /usr/local/cuda-${CUDA_VERSION}/include/cudnn*.h /usr/local/cuda-${CUDA_VERSION}/lib64/libcudnn*

# Remove downloaded files:
rm -rf cud*

# Check installed cuDNN version:
cat /usr/local/cuda-${CUDA_VERSION}/include/cudnn.h | grep CUDNN_MAJOR -A 2
# Or:
cat /usr/local/cuda-${CUDA_VERSION}/include/cudnn_version.h | grep CUDNN_MAJOR -A 2

# cuDNN installation complete!
```

## [OPTIONAL] Install TensorRT

### Download TensorRT

* **IMPORTANT!** **Download and use the .TAR.GZ file!** You can install TensorRT into a custom directory, which means you can control which version of TensorRT you want to use and where to install it.
* **IMPORTANT!** **Don't download and use .DEB file!** You can't control TensorRT libraries.
* Download the cuDNN **.TAR.GZ** file from this link: [https://developer.nvidia.com/nvidia-tensorrt-download](https://developer.nvidia.com/nvidia-tensorrt-download)

### Install TensorRT .tar.gz package files

```bash
# Change directory to TensorRT-***.tar.gz file downloaded directory. For example:
cd ~/Downloads

# Extract TensorRT .tar.gz package file:
tar -xzf TensorRT-[TENSORRT_VERSION].[OS_DISTRO].x86_64-gnu.cuda-[CUDA_VERSION].cudnn[CUDNN_VERSION].tar.gz
# For example:
tar -xzf TensorRT-7.2.0.14.Ubuntu-18.04.x86_64-gnu.cuda-11.0.cudnn8.0.tar.gz

# Create TensorRT base directory:
sudo mkdir -vp /opt/tensorrt

# Copy extracted files into TensorRT directory:
sudo mv -vf TensorRT-[TENSORRT_VERSION] /opt/tensorrt/TensorRT-[TENSORRT_VERSION]
# For example:
sudo mv -vf TensorRT-7.2.0.14 /opt/tensorrt/TensorRT-7.2.0.14

# Remove downloaded file:
rm -vrf TensorRT-[TENSORRT_VERSION].[OS_DISTRO].x86_64-gnu.cuda-[CUDA_VERSION].cudnn[CUDNN_VERSION].tar.gz
# For example:
rm -vrf TensorRT-7.2.0.14.Ubuntu-18.04.x86_64-gnu.cuda-11.0.cudnn8.0.tar.gz
```

Edit the `~/.bashrc` file:

```bash
# Add TensorRT environment variables into current user .bashrc file:
# (It loads environment variables, whenever current user opens a new bash session/new terminal)
nano ~/.bashrc
```

and add the following lines into the `~/.bashrc` file (don't forget to change **TENSORRT_VERSION** into the installed version):

```bash
## TensorRT ##
# Change to your installed TensorRT version:
# export TENSORRT_VERSION=[TENSORRT_VERSION]
export TENSORRT_VERSION=7.2.0.14
export TENSORRT_PATH="/opt/tensorrt/TensorRT-${TENSORRT_VERSION}"
export PATH="${TENSORRT_VERSION}/bin:${PATH}"
export LD_LIBRARY_PATH="${TENSORRT_PATH}/lib:${LD_LIBRARY_PATH}"
```

```bash
# Load .bashrc file to init environment variables into current bash session:
source ~/.bashrc

# (Only for Python) Install TensorRT python packages:
cd ${TENSORRT_PATH}/python
pip install tensorrt-[TENSORRT_VERSION]-cp[PYTHON_VERSION]-none-linux_x86_64.whl
# For example:
pip install tensorrt-7.2.0.14-cp38-none-linux_x86_64.whl

cd ${TENSORRT_PATH}/uff
pip install uff-*-py2.py3-none-any.whl

cd ${TENSORRT_PATH}/graphsurgeon
pip install graphsurgeon-*-py2.py3-none-any.whl

cd ${TENSORRT_PATH}/onnx_graphsurgeon
pip install onnx_graphsurgeon-*-py2.py3-none-any.whl

# TensorRT installation complete!
```

## Test CUDA

```bash
# Install sample source codes to test CUDA:
cuda-install-samples-[CUDA_VERSION].sh ~
# For example:
cuda-install-samples-11.0.sh ~

# Change directory to CUDA sample source codes installed directory:
cd ~/NVIDIA_CUDA-[CUDA_VERSION]_Samples
# For example:
cd ~/NVIDIA_CUDA-11.0_Samples

# Build sample source codes:
make clean && make -j8

# Change directory to built binary directory:
cd bin/x86_64/linux/release

# Run CUDA test binaries:
./deviceQuery
./bandwidthTest

cd ~
# Remove sample source codes:
rm -rf ~/NVIDIA_CUDA-[CUDA_VERSION]_Samples
# For example:
rm -rf ~/NVIDIA_CUDA-11.0_Samples
```

:sparkles:

## INSTALLATION COMPLETE
