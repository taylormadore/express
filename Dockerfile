FROM registry.access.redhat.com/ubi10/ubi@sha256:7c51a894033b58059cfd171b8a9a2c064cddf8b6082a2d19ff9d8c7aa5b543c9

WORKDIR /src
COPY . .

RUN dnf install -y \
    --setopt install_weak_deps=0 \
    --nodocs \
    nodejs \
    nodejs-npm \
    && dnf clean all

RUN npm ci
