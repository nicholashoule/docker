# Golang developer playground for building arm Go services

## Use this command to start the container:

```
docker run --rm -it --name golang-dev 181gaming/golang-armv6:1.11.1
```

## Versions:

* 1.11.1, [1.11.1/Dockerfile](https://github.com/nicholashoule/docker/tree/master/golang-armv6/1.11.1/)

## Information:

### Running the container on Linux x86_64

Fedora:$ dnf install -y qemu qemu-user qemu-user-binfmt

  - or -

Ubuntu:$ apt install -y qemu qemu-user-static qemu-user binfmt-support

* docker run --rm --privileged multiarch/qemu-user-static:register
* docker run --rm --privileged multiarch/qemu-user-static:register --reset
* docker run --rm -it --name golang-dev 181gaming/golang-armv6

[Go Playground](https://play.golang.org/)

## Building:

```
go version

go tool dist list | grep -E 'arm|amd64'
android/amd64
android/arm
android/arm64
linux/amd64
linux/arm
linux/arm64
```

### amd64:

```
env GOOS=linux GOARCH=amd64 go build -o /amd64/app
```

### armv6:

```
env GOOS=linux GOARCH=arm go build -o /arm/app
```

### Links:

[From Wikipedia, golang](https://en.wikipedia.org/wiki/Go_%28programming_language%29)

Go (often referred to as Golang) is a programming language designed by Google. Go is statically typed, compiled, and syntactically similar to C, with the added benefits of memory safety, garbage collection, structural typing, and CSP-style concurrency. The compiler, tools, and source code are all free and open source.
