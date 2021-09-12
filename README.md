# http-server

![CircleCI](https://img.shields.io/circleci/build/github/fitraalim/http-server/master?style=for-the-badge) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/fitraalim/http-server/latest?style=for-the-badge)  ![Docker Pulls](https://img.shields.io/docker/pulls/fitraalim/http-server?style=for-the-badge) ![GitHub last commit (branch)](https://img.shields.io/github/last-commit/fitraalim/http-server/master?style=for-the-badge)

## Lightweight HTTP Server

[http-server](https://www.npmjs.com/package/http-server) is very light HTTP server to serve static content. This container runs on port 8080.
You can find my ready to use container image in [my public Docker Hub repository](https://hub.docker.com/r/fitraalim/http-server).

## Usage

The static content is in `/public` directory. Copy your static content to this directory during build process.
If you use React, for example, copy your build package output directory (usually `build` directory to `/public` directory in the container. Your `Dockerfile` should looks like:

```
# Stage 1
FROM node:14.17.6-stretch-slim AS build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json .
COPY . .
RUN yarn install
RUN yarn build

# Stage 2
FROM fitraalim/http-server:latest
COPY --from=build-step /app/build/ /public
```

For testing, you can `COPY` single `index.html` to `/public` directory in the container.
 Assuming the `index.html` is in your current directory, then:

```
# Stage 1
FROM node:14.17.6-stretch-slim AS build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json .
COPY . .
RUN yarn install
RUN yarn build

# Stage 2
FROM fitraalim/http-server:latest
COPY index.html /public
```

## Source

You can find `Dockerfile` to build this container in [my GitHub](https://github.com/fitraalim/http-server).
