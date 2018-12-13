# Golang developer playground for building Go services

## Use this command to start the container:

```
docker run --rm -it --name golang-dev 181gaming/golang:1.11.2
```

## Versions:

* 1.11.2, [1.11.2/Dockerfile](https://github.com/nicholashoule/docker/tree/master/golang/1.11.2/)

## Information:

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
