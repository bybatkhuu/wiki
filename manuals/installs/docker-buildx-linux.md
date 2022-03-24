# Use Docker Buildx for Multi-Architecture Images

## Official pages

* Docker Buildx - [https://docs.docker.com/buildx/working-with-buildx/](https://docs.docker.com/buildx/working-with-buildx/)

---

* [REQUIRED] Docker Buildx requires Docker >= 19.03
* [REQUIRED] Linux kernel >= 4.8
* [REQUIRED] binfmt_misc file system mounted
* [REQUIRED] Either a Host installation or Docker image based installation of QEMU and binfmt_misc support tools
* If you happen to run on a system that has Docker Desktop >= 2.1.0 installed, e.g. on Mac OSX or Windows, you’re in luck since it comes configured meeting all the above requirements.

## 1. Enable Docker Buildx

### Binfmt_misc File System

```bash
$ ls /proc/sys/fs/binfmt_misc/
register status
```

### 1.1. Host installation

```bash
# QEMU installation
# installs QEMU for a number of foreign architectures
sudo apt-get install -y qemu-user-static

# see installation e.g. 64-bit ARM (aarch64)
ls -l /usr/bin/qemu-aarch64-static

# check version
qemu-aarch64-static --version

# update-binfmts Tool
sudo apt-get install -y binfmt-support

# check version
update-binfmts --version
```

### 1.2. Docker image based installation

```bash
# use image, multiarch/qemu-user-static
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
```

## 2. Building Multi-Architecture Docker Images With Buildx

### 2.1. Creating a Buildx Builder

```bash
# create Buildx Builder
docker buildx create --name mybuilder

docker buildx use mybuilder

# check newly created builder
# check available platforms
docker buildx inspect --bootstrap
```

### 2.2. Using Buildx to build image

```bash
# build image for linux/arm64
# --load option instructs docker to load the resulting image into the local docker images list
docker buildx build --load --tag "buildx-test" --platform linux/arm64 .

# inspect newly created image
docker buildx imagetools inspect --tag "buildx-test"
```

## References

* Building Multi-Architecture Docker Images With Buildx: [https://medium.com/@artur.klauser/building-multi-architecture-docker-images-with-buildx-27d80f7e2408](https://medium.com/@artur.klauser/building-multi-architecture-docker-images-with-buildx-27d80f7e2408)
