FROM registry.access.redhat.com/ubi10/ubi@sha256:738a053c6648573f9d58341312e5574716382420a9c40ed4e3175d148ba257d2

WORKDIR /src
COPY . .

RUN dnf install -y \
    --setopt install_weak_deps=0 \
    --nodocs \
    nodejs \
    nodejs-npm \
    && dnf clean all

RUN NPM_CONFIG_REGISTRY=https://artifact-registry-proxy.caching.svc.cluster.local/repository/npm-proxy/ npm ci
