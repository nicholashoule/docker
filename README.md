# Docker for Developers

Building and deploying new applications is faster with containers. Docker containers wrap up software and its dependencies into a standardized unit for software development that includes everything it needs to run: code, runtime, system tools and libraries. This guarantees that your application will always run the same and makes collaboration as simple as sharing a container image.

Docker containers whether Windows or Linux are backed by Docker tools and APIs and help you build better software:

* Onboard faster and stop wasting hours trying to set up development environments, spin up new instances and make copies of production code to run locally.

* Enable polyglot development and use any language, stack or tools without worry of application conflicts.

* Eliminate environment inconsistencies and the "works on my machine" problem by packaging the application, configs and dependencies into an isolated container.

* Alleviate concern over application security

### Links:

[Docker, get-started](https://www.docker.com/get-started#nav-devloper)

[From Wikipedia, Docker](https://en.wikipedia.org/wiki/Docker_%28software%29)

Docker is used to run software packages called "containers". Containers are isolated from each other and bundle their own application, tools, libraries and configuration files; they can communicate with each other through well-defined channels. All containers are run by a single operating system kernel and are thus more lightweight than virtual machines. Containers are created from "images" that specify their precise contents. Images are often created by combining and modifying standard images downloaded from public repositories.

# Get Docker

##### Windows:

https://www.docker.com/products/docker-desktop

##### Mac:

https://docs.docker.com/docker-for-mac/install/

##### Linux:

https://docs.docker.com/install/


# Running containers:

```
docker --version
```

```
docker run --help

Usage:	docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

Run a command in a new container

Options:
  -d, --detach                         Run container in background and print container ID
  -i, --interactive                    Keep STDIN open even if not attached
      --name string                    Assign a name to the container
  -p, --publish list                   Publish a container's port(s) to the host
      --rm                             Automatically remove the container when it exits
      --restart string                 Restart policy to apply when a container exits (default "no")
  -t, --tty                            Allocate a pseudo-TTY

```

## Redis:

##### Bash
```
sudo docker run -it --rm \
-p 6379:6379 --name some-redis redis:4.0
```

## Postgres:

##### Bash
```
sudo docker run -it --rm \
-p 5432:5432 --name some-postgres \
-e POSTGRES_PASSWORD=password \
-e POSTGRES_USER=postgres \
postgres:9.5
```

# Start container on boot:
```
docker run -dit --restart unless-stopped -p 5432:5432 --name some-postgres -e POSTGRES_PASSWORD=password -e POSTGRES_USER=postgres postgres:9.5
```
