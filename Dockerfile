FROM registry.access.redhat.com/ubi10/ubi@sha256:4690398669a07627339936c9e79b05233053056ce688efeb4400d3c1c530486b

WORKDIR /src
COPY . .

RUN dnf install -y \
    --setopt install_weak_deps=0 \
    --nodocs \
    nodejs \
    && dnf clean all

RUN .yarn/releases/yarn-4.14.1.cjs install
