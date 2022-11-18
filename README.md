# Seleniarm Chrome

This repository contains the Dockerfile for building a multi-architecture selenium image that can be used with ddev and SSL support.

## Usage

To add seleniarm to your ddev configuration, copy the [docker-compose.selenium.yaml](./docker-compose.selenium.yaml) into your `.ddev` directory.

    Tip: If you don't want to always start the selenium service, move the file to the `.ddev/.disabled-services`. This way you can run `ddev service enable selenium` to quickly enable/disable the start of the container.

## Image build

The docker image is build with `buildx`. 

```
docker buildx create --name mybuilder --use --bootstrap
```

```
docker buildx build --push --platform linux/amd64,linux/arm64 --tag maikschneider/seleniarm-ddev:latest .
```

For more information on how to build multi-images, see the blog post: [How to Rapidly Build Multi-Architecture Images with Buildx](https://www.docker.com/blog/how-to-rapidly-build-multi-architecture-images-with-buildx/)
