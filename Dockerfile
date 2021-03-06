FROM debian:buster

RUN apt-get update && apt-get install -y -q \
    bash \
    bc \
    binutils \
    build-essential \
    bzip2 \
    ca-certificates \
    cpio \
    debianutils \
    file \
    g++ \
    gcc \
    git \
    graphviz \
    gzip \
    libncurses5-dev \
    locales \
    make \
    patch \
    perl \
    python3 \
    python3-matplotlib \
    python3-setuptools \
    rsync \
    sed \
    tar \
    unzip \
    wget

RUN locale-gen en_US.utf8
