# Docker commands

## Official pages

* Docker commands - [https://docs.docker.com/engine/reference/commandline/docker](https://docs.docker.com/engine/reference/commandline/docker)
* Docker-compose CLI overview - [https://docs.docker.com/compose/reference](https://docs.docker.com/compose/reference)
* Docker compose - [https://docs.docker.com/engine/reference/commandline/compose](https://docs.docker.com/engine/reference/commandline/compose)
* Compose file - [https://docs.docker.com/compose/compose-file/compose-file-v3](https://docs.docker.com/compose/compose-file/compose-file-v3)
* Docker swarm - [https://docs.docker.com/engine/reference/commandline/swarm](https://docs.docker.com/engine/reference/commandline/swarm)
* Docker stack - [https://docs.docker.com/engine/reference/commandline/stack](https://docs.docker.com/engine/reference/commandline/stack)
* Docker service - [https://docs.docker.com/engine/reference/commandline/service](https://docs.docker.com/engine/reference/commandline/service)

---

## Prerequisites

* Install **docker** and **docker-compose (v.2.2.3)**:
    * Linux - [https://github.com/bybatkhuu/wiki/blob/main/manuals/installs/docker-linux.md](https://github.com/bybatkhuu/wiki/blob/main/manuals/installs/docker-linux.md)
    * Windows - [https://github.com/bybatkhuu/wiki/blob/main/manuals/installs/docker-windows.md](https://github.com/bybatkhuu/wiki/blob/main/manuals/installs/docker-windows.md)
    * Offline binaries - [https://docs.docker.com/engine/install/binaries](https://docs.docker.com/engine/install/binaries)

## Commands

### Docker pull

```sh
# Download docker image:
docker pull [NAMESPACE]/[REPO_NAME]:[VERSION_TAG]
# For example:
docker pull username/my_app:1.0
```

### Docker images

```sh
# List docker images:
docker images
```

### Docker run

```sh
# Run docker image as a container:
docker run -d --name [CONTAINER_NAME] --restart unless-stopped -e [ENV_VARIABLE]=[VALUE] -v [OUT_PATH]:[IN_PATH] -p [OUT_PORT]:[IN_PORT] [IMAGE_NAME]

# For example:
docker run -d -p 3000:3000 getting-started

# Run portainer as example:
docker run -d \
    --name portainer \
    --restart unless-stopped \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ${PWD}/portainer/data:/data \
    -p 8000:8000 \
    -p 9443:9443 \
    portainer/portainer-ce:2.11.1

# Run MySQL as example:
docker run \
    -d \
    --name mysql \
    --restart unless-stopped
    -e MYSQL_ROOT_PASSWORD="mysql_password" \
    -p 3306:3306 \
    -v ${PWD}/mysql/conf.d:/etc/mysql/conf.d \
    -v ${PWD}/mysql/docker-entrypoint-initdb.d:/docker-entrypoint-initdb.d \
    -v ${PWD}/mysql/db:/var/lib/mysql \
    mysql:8.0.12 \
    --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci --default-authentication-plugin=mysql_native_password
```

### Docker ps

```sh
# List running containers:
docker ps -a
```

### Docker image

```sh
# Docker remove image:
docker rmi -f [IMAGE_ID]
# For example:
docker rmi -f 7ae9d46dd44a

# Or by docker image name:
docker rmi -f [IMAGE_NAME]
# For example:
docker rmi -f username/my_app:1.0


# Remove left-over middle images:
docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc) 2> /dev/null || true
```

---

## Help

```sh
docker help
```

```txt
Usage:  docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default "/home/batkhuu/.docker")
  -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with "docker context use")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/home/batkhuu/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/home/batkhuu/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/home/batkhuu/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  app*        Docker App (Docker Inc., v0.9.1-beta3)
  builder     Manage builds
  buildx*     Docker Buildx (Docker Inc., v0.8.0-docker)
  checkpoint  Manage checkpoints
  config      Manage Docker configs
  container   Manage containers
  context     Manage contexts
  image       Manage images
  manifest    Manage Docker image manifests and manifest lists
  network     Manage networks
  node        Manage Swarm nodes
  plugin      Manage plugins
  scan*       Docker Scan (Docker Inc., v0.17.0)
  secret      Manage Docker secrets
  service     Manage services
  stack       Manage Docker stacks
  swarm       Manage Swarm
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker COMMAND --help' for more information on a command.

To get more help with docker, check out our guides at https://docs.docker.com/go/guides/
```

## Docker command cheat sheet

* Cheat sheet 1 - [https://github.com/bybatkhuu/wiki/blob/main/files/docker-commands-cheat-sheet-1.pdf](https://github.com/bybatkhuu/wiki/blob/main/files/docker-commands-cheat-sheet-1.pdf)
* Cheat sheet 2 - [https://github.com/bybatkhuu/wiki/blob/main/files/docker-commands-cheat-sheet-2.pdf](https://github.com/bybatkhuu/wiki/blob/main/files/docker-commands-cheat-sheet-2.pdf)

---

## References

* [https://phoenixnap.com/kb/list-of-docker-commands-cheat-sheet](https://phoenixnap.com/kb/list-of-docker-commands-cheat-sheet)
* [https://www.edureka.co/blog/docker-commands](https://www.edureka.co/blog/docker-commands)
* [https://pagertree.com/2020/01/06/docker-cheat-sheet](https://pagertree.com/2020/01/06/docker-cheat-sheet)
