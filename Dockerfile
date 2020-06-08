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
RUN mkdir -p /dist/lib && cp /lib/x86_64-linux-gnu/libselinux.so.1 /lib/x86_64-linux-gnu/libpcre.so.3.13.3 /dist/lib/ && cd /dist/lib/ && ln -s libpcre.so.3.13.3 libpcre.so.3

FROM gcr.io/distroless/cc
COPY --from=build-env /dist/lib /lib/x86_64-linux-gnu/
COPY --from=build-env /dist/bin /bin/
COPY --from=build-env /usr/bin/env /usr/bin/find /usr/bin/node /usr/bin/

ENTRYPOINT ["/usr/bin/node"]
