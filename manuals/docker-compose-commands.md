# Docker-compose commands

## Official pages

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

### Pull all images

```sh
docker-compose pull
```

### Start docker-compose services

```sh
docker-compose up -d

# Or start only one specific service:
docker-compose up -d [SERVICE_NAME]
# For example:
docker-compose up -d my_service
```

### List docker-compose services

```sh
docker-compose ps
```

### Show running processes of docker-compose service

```sh
docker-compose top [SERVICE_NAME]
# For example:
docker-compose top my_service
```

### Show docker-compose logs

```sh
docker-compose logs -f --tail 100

# Or show only one service/container logs:
docker-compose ps -q [SERVICE_NAME] | xargs -n 1 docker logs -f -n 100
# For example:
docker-compose ps -q my_service | xargs -n 1 docker logs -f -n 100
```

### Show resources usage of docker-compose services

```sh
docker stats $(docker-compose ps -q)
```

### Execute command in docker-compose service

```sh
docker-compose exec [SERVICE_NAME] [COMMAND]
# For example:
docker-compose exec my_service ls -l
```

### Enter into docker-compose service

```sh
docker-compose exec [SERVICE_NAME] /bin/bash
# For example:
docker-compose exec my_service /bin/bash

# Or by sh:
docker-compose exec [SERVICE_NAME] /bin/sh
# For example:
docker-compose exec my_service sh
```

### Stop docker-compose services

```sh
docker-compose down

# Or stop only one service:
docker-compose rm -svf [SERVICE_NAME]
# For example:
docker-compose rm -svf my_service
```

### Update docker-compose service images

```sh
docker-compose down
docker-compose pull
docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc) > /dev/null 2>&1 || true
```

### Validate docker-compose yaml file

```sh
docker-compose config
```

### Check docker-compose version

```sh
docker-compose version
```

---

## Help

```sh
docker-compose help
```

```txt
Usage:  docker compose [OPTIONS] COMMAND

Docker Compose

Options:
      --ansi string                Control when to print ANSI control characters ("never"|"always"|"auto") (default "auto")
      --compatibility              Run compose in backward compatibility mode
      --env-file string            Specify an alternate environment file.
  -f, --file stringArray           Compose configuration files
      --profile stringArray        Specify a profile to enable
      --project-directory string   Specify an alternate working directory
                                   (default: the path of the Compose file)
  -p, --project-name string        Project name

Commands:
  build       Build or rebuild services
  convert     Converts the compose file to platform's canonical format
  cp          Copy files/folders between a service container and the local filesystem
  create      Creates containers for a service.
  down        Stop and remove containers, networks
  events      Receive real time events from containers.
  exec        Execute a command in a running container.
  images      List images used by the created containers
  kill        Force stop service containers.
  logs        View output from containers
  ls          List running compose projects
  pause       Pause services
  port        Print the public port for a port binding.
  ps          List containers
  pull        Pull service images
  push        Push service images
  restart     Restart containers
  rm          Removes stopped service containers
  run         Run a one-off command on a service.
  start       Start services
  stop        Stop services
  top         Display the running processes
  unpause     Unpause services
  up          Create and start containers
  version     Show the Docker Compose version information

Run 'docker compose COMMAND --help' for more information on a command.
```

## Docker command cheat sheet

* Cheat sheet 2 - [https://github.com/bybatkhuu/wiki/blob/main/files/docker-cheat-sheet.2.pdf](https://github.com/bybatkhuu/wiki/blob/main/files/docker-cheat-sheet.2.pdf)

---

## References

* [https://devhints.io/docker-compose](https://devhints.io/docker-compose)
* [https://dockerlabs.collabnix.com/docker/cheatsheet](https://dockerlabs.collabnix.com/docker/cheatsheet)
* [https://gist.github.com/jonlabelle/bd667a97666ecda7bbc4f1cc9446d43a](https://gist.github.com/jonlabelle/bd667a97666ecda7bbc4f1cc9446d43a)
