# Docker Alpine Pytorch v2+

Image is based on Alpine `3.9-alpine3.18` and is v2.2.1 of Pytorch.

ARM and x86_64 are available via `marcjschmidt/pytorch`: https://hub.docker.com/r/marcjschmidt/pytorch

# Build

```ssh
export VERSION=v2.2.1
docker build --build-arg VERSION=${VERSION} -t marcjschmidt/pytorch:${VERSION} .
```

Note: In order to get Pytorch working in Alpine, a patch is necessary.
See patches/c10.patch (https://github.com/pytorch/pytorch/issues/55865).
