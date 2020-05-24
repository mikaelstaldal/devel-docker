FROM ubuntu:18.04 AS build-env
ARG NODE_VERSION
RUN \
    apt-get update && \
    apt-get install -y curl
RUN \
    curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs

RUN mkdir -p /dist/bin && cp /bin/dash /dist/bin/ && cd /dist/bin/ && ln -s dash sh

FROM gcr.io/distroless/cc
COPY --from=build-env /usr/bin/env /usr/bin/node /usr/bin/
COPY --from=build-env /dist/bin /bin/

ENTRYPOINT ["/usr/bin/node"]
