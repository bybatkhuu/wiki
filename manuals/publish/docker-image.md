# Push Docker Image into Docker Hub

## Getting started

### 1. Prerequisites

* Install **docker** and **docker-compose (v.2.2.3)**:
    * Linux - [https://github.com/bybatkhuu/wiki/blob/main/manuals/installs/docker-linux.md](https://github.com/bybatkhuu/wiki/blob/main/manuals/installs/docker-linux.md)
    * Windows - [https://github.com/bybatkhuu/wiki/blob/main/manuals/installs/docker-windows.md](https://github.com/bybatkhuu/wiki/blob/main/manuals/installs/docker-windows.md)
    * Offline binaries - [https://docs.docker.com/engine/install/binaries](https://docs.docker.com/engine/install/binaries)

### 2. Create repository

* Register new account or login to Docker Hub - [https://hub.docker.com](https://hub.docker.com)
* Create new docker hub repository - [https://docs.docker.com/docker-hub/repos](https://docs.docker.com/docker-hub/repos)

### 3. Build or commit Docker images

```sh
docker build -t [NAMESPACE]/[REPO_NAME]:[VERSION_TAG] .
# For example:
docker build -t username/my_app:1.0 .


# Or commit docker container into image by container name:
docker commit [CONTAINER_NAME] [NAMESPACE]/[REPO_NAME]:[VERSION_TAG]
# For example:
docker commit my_app_1 username/my_app:1.0

# Or commit docker container into image by container ID:
docker commit [CONTAINER_ID] [NAMESPACE]/[REPO_NAME]:[VERSION_TAG]
# For example:
docker commit 41d270993ba0 username/my_app:1.0


# Or change the image tag (full image name):
docker tag [FULL_IMAGE_NAME] [NAMESPACE]/[REPO_NAME]:[VERSION_TAG]
# For example:
docker tag my_image username/my_app:1.0

# Or give a new tag (full image name) by image ID:
docker tag [IMAGE_ID] [NAMESPACE]/[REPO_NAME]:[VERSION_TAG]
# For example:
docker tag 7ae9d46dd44a username/my_app:1.0
```

### 4. Push docker image into Docker Hub

```sh
# Login by docker hub account:
docker login -u [USERNAME]
# For example:
docker login -u username

# Push docker images:
docker push [NAMESPACE]/[REPO_NAME]:[VERSION_TAG]
# For example:
docker push username/my_app:1.0
```

### 5. Pull and test docker image

```sh
docker pull [NAMESPACE]/[REPO_NAME]:[VERSION_TAG]
# For example:
docker pull username/my_app:1.0
```

:sparkles:

## DONE

---

## Help

```sh
docker build --help
```

```txt
Usage:  docker build [OPTIONS] PATH | URL | -

Build an image from a Dockerfile

Options:
      --add-host list           Add a custom host-to-IP mapping (host:ip)
      --build-arg list          Set build-time variables
      --cache-from strings      Images to consider as cache sources
      --cgroup-parent string    Optional parent cgroup for the container
      --compress                Compress the build context using gzip
      --cpu-period int          Limit the CPU CFS (Completely Fair Scheduler) period
      --cpu-quota int           Limit the CPU CFS (Completely Fair Scheduler) quota
  -c, --cpu-shares int          CPU shares (relative weight)
      --cpuset-cpus string      CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems string      MEMs in which to allow execution (0-3, 0,1)
      --disable-content-trust   Skip image verification (default true)
  -f, --file string             Name of the Dockerfile (Default is 'PATH/Dockerfile')
      --force-rm                Always remove intermediate containers
      --iidfile string          Write the image ID to the file
      --isolation string        Container isolation technology
      --label list              Set metadata for an image
  -m, --memory bytes            Memory limit
      --memory-swap bytes       Swap limit equal to memory plus swap: '-1' to enable unlimited swap
      --network string          Set the networking mode for the RUN instructions during build (default "default")
      --no-cache                Do not use cache when building the image
      --pull                    Always attempt to pull a newer version of the image
  -q, --quiet                   Suppress the build output and print image ID on success
      --rm                      Remove intermediate containers after a successful build (default true)
      --security-opt strings    Security options
      --shm-size bytes          Size of /dev/shm
      --squash                  Squash newly built layers into a single new layer
  -t, --tag list                Name and optionally a tag in the 'name:tag' format
      --target string           Set the target build stage to build.
      --ulimit ulimit           Ulimit options (default [])
```

---

## References

* [https://docs.docker.com/engine/reference/commandline/push](https://docs.docker.com/engine/reference/commandline/push)
* [https://docs.docker.com/engine/reference/commandline/build](https://docs.docker.com/engine/reference/commandline/build)
* [https://docs.docker.com/engine/reference/commandline/commit](https://docs.docker.com/engine/reference/commandline/commit)
* [https://docs.docker.com/engine/reference/commandline/tag](https://docs.docker.com/engine/reference/commandline/tag)
* [https://jsta.github.io/r-docker-tutorial/04-Dockerhub.html](https://jsta.github.io/r-docker-tutorial/04-Dockerhub.html)
* [https://medium.com/codex/push-docker-image-to-docker-hub-acc978c76ad](https://medium.com/codex/push-docker-image-to-docker-hub-acc978c76ad)
