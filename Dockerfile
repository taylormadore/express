FROM registry.access.redhat.com/ubi10/ubi@sha256:223f8b83bcaa1159416724627ff2fadbfd2444653756b0c00d9dae1eacccbfbc

WORKDIR /src
COPY . .

RUN dnf install -y \
    --setopt install_weak_deps=0 \
    --nodocs \
    nodejs \
    nodejs-npm \
    && dnf clean all

RUN npm ci
