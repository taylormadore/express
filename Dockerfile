FROM registry.access.redhat.com/ubi10/ubi@sha256:6e3f045f5380e8d8dffaea7e01bf926d2db44aff751048697e780d1253687843

WORKDIR /src
COPY . .

RUN dnf install -y \
    --setopt install_weak_deps=0 \
    --nodocs \
    nodejs \
    && dnf clean all

RUN .yarn/releases/yarn-4.14.1.cjs install
