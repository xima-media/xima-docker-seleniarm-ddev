FROM seleniarm/standalone-chromium:107.0-20221104 as base

FROM base AS base-amd64
ENV TARGET_MKCERT_PLATFORM "amd64"

FROM base AS base-arm64
ENV TARGET_MKCERT_PLATFORM "arm64"


ARG TARGETARCH
FROM base-$TARGETARCH

USER root
ENV CAROOT=/mnt/ddev-global-cache/mkcert

# Install mkcert
RUN apt-get update && apt-get install -y libnss3-tools
RUN curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/$TARGET_MKCERT_PLATFORM" \
    && chmod +x mkcert-v*-linux-$TARGET_MKCERT_PLATFORM \
    && cp mkcert-v*-linux-$TARGET_MKCERT_PLATFORM /usr/local/bin/mkcert
RUN mkcert -install