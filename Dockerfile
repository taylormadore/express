FROM registry.access.redhat.com/ubi10/ubi@sha256:454c3b22fd9dc97859df5a6bce662da1af5e3cf18313ef034190de3759392add

WORKDIR /src
COPY . .

RUN dnf install -y \
    --setopt install_weak_deps=0 \
    --nodocs \
    nodejs \
    nodejs-npm \
    && dnf clean all

RUN npm ci
