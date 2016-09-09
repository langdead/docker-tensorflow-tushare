FROM b.gcr.io/tensorflow/tensorflow:latest

MAINTAINER Meng.Hu <humeng.jade@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y \
    libxml2 \
    python-lxml \
    libblas-dev \
    liblapack-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip --no-cache-dir install \
  --upgrade pip

# Install dependences
RUN pip --no-cache-dir install \
  pandas \
  cvxopt

# Install tushare
RUN pip --no-cache-dir install \
  tushare