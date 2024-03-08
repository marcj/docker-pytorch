FROM python:3.9-alpine3.18 as python

ARG VERSION=v2.2.1

RUN apk add --no-cache git

RUN git clone --recursive https://github.com/pytorch/pytorch.git --branch $VERSION --depth 1 /pytorch

RUN apk add --no-cache build-base cmake linux-headers openblas-dev libffi-dev expat
RUN pip install --no-cache-dir pyyaml typing-extensions numpy

WORKDIR /pytorch
ENV BLAS="OpenBLAS"
ENV BUILD_CAFFE2=OFF
ENV BUILD_TEST=OFF
ENV BUILD_DISTRIBUTED=OFF
ENV USE_DISTRIBUTED=OFF
ENV USE_QNNPACK=OFF
ENV USE_PYTORCH_QNNPACK=OFF
ENV USE_KINETO=OFF
ENV USE_NUMPY=OFF
ENV USE_CUDA=OFF
ENV USE_ROCM=OFF
ENV USE_MKLDNN=OFF
ENV USE_NUMA=OFF
ENV USE_ONNX=OFF

ENV USE_OBSERVERS=OFF
ENV USE_XNNPACK=OFF

COPY patches/ /pytorch/patches/
RUN git apply patches/*.patch

ENV MAKEFLAGS="-j$(nproc)"
RUN python setup.py install
