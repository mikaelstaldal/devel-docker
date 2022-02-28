FROM ubuntu:20.04 AS build-env
ARG NODE_VERSION
RUN apt-get update && \
    apt-get install -y curl

RUN curl -fsL "https://deb.nodesource.com/setup_${NODE_VERSION}.x" | bash - && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

RUN mkdir -p /dist/bin && \
    cp /bin/dash /dist/bin/ && \
    cd /dist/bin && \
    ln -s dash sh
RUN mkdir -p /dist/usr-bin && \
    cp /usr/bin/env /usr/bin/find /usr/bin/node /dist/usr-bin/ && \
    cd /dist/usr-bin && \
    ln -s /usr/lib/node_modules/npm/bin/npm-cli.js npm && \
    ln -s /usr/lib/node_modules/npm/bin/npx-cli.js npx
RUN mkdir -p /dist/lib && \
    cp /lib/x86_64-linux-gnu/libselinux.so.1 /lib/x86_64-linux-gnu/libpcre.so.3.13.3 /dist/lib/ && \
    cd /dist/lib && \
    ln -s libpcre.so.3.13.3 libpcre.so.3

FROM gcr.io/distroless/cc
COPY --from=build-env /dist/lib /lib/x86_64-linux-gnu/
COPY --from=build-env /dist/bin /bin/
COPY --from=build-env /dist/usr-bin /usr/bin/

ENTRYPOINT ["/usr/bin/node"]
