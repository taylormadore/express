FROM registry.access.redhat.com/ubi10/ubi@sha256:a75ad754aa048d808dd3260243452f8c9a665831d0493b4c9d92f0c88fe2f8c3

WORKDIR /src
COPY . .

RUN dnf install -y \
    --setopt install_weak_deps=0 \
    --nodocs \
    nodejs \
    && dnf clean all

RUN .yarn/releases/yarn-4.14.1.cjs install
