FROM registry.access.redhat.com/ubi10/ubi@sha256:37d90a02d14afed06b6fff1ed0a33cd07b96187e90ed46d8871fdce550538b43

WORKDIR /src
COPY . .

RUN dnf install -y \
    --setopt install_weak_deps=0 \
    --nodocs \
    nodejs \
    && dnf clean all

RUN .yarn/releases/yarn-4.14.1.cjs install
