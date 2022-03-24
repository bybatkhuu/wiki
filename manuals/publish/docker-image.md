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

## References

* [https://docs.docker.com/engine/reference/commandline/push](https://docs.docker.com/engine/reference/commandline/push)
* [https://docs.docker.com/engine/reference/commandline/build](https://docs.docker.com/engine/reference/commandline/build)
* [https://docs.docker.com/engine/reference/commandline/commit](https://docs.docker.com/engine/reference/commandline/commit)
* [https://docs.docker.com/engine/reference/commandline/tag](https://docs.docker.com/engine/reference/commandline/tag)
* [https://jsta.github.io/r-docker-tutorial/04-Dockerhub.html](https://jsta.github.io/r-docker-tutorial/04-Dockerhub.html)
* [https://medium.com/codex/push-docker-image-to-docker-hub-acc978c76ad](https://medium.com/codex/push-docker-image-to-docker-hub-acc978c76ad)
