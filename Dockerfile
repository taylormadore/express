FROM registry.access.redhat.com/ubi10/ubi@sha256:0e8ccad7d35f5fd756f4f2202f018b8d3c3e8bb9af8e627d874239381a00ab41

WORKDIR /src
COPY . .

RUN dnf install -y \
    --setopt install_weak_deps=0 \
    --nodocs \
    nodejs \
    nodejs-npm \
    && dnf clean all

RUN npm ci
