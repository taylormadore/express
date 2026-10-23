FROM registry.access.redhat.com/ubi10/ubi@sha256:7495bfa53ae7a81a58aeface0bb4858d12741832c542c29dc690d67b183b73b0

WORKDIR /src
COPY . .

RUN dnf install -y \
    --setopt install_weak_deps=0 \
    --nodocs \
    nodejs \
    && dnf clean all

RUN .yarn/releases/yarn-4.14.1.cjs install
