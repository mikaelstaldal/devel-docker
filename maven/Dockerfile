ARG JAVA_VERSION
FROM ubuntu:20.04 AS build-env
ARG MAVEN_VERSION
RUN apt-get update && \
    apt-get install -y curl

RUN mkdir -p /dist/bin && \
    cp /bin/dash /dist/bin/ && \
    cd /dist/bin && \
    ln -s dash sh
RUN mkdir -p /dist/usr-bin && \
    cp /usr/bin/env /usr/bin/uname /usr/bin/dirname /usr/bin/ls /usr/bin/expr /dist/usr-bin/
RUN mkdir -p /dist/lib && \
    cp /lib/x86_64-linux-gnu/libselinux.so.1 /lib/x86_64-linux-gnu/libpcre2-8.so.0.9.0 /dist/lib/ && \
    cd /dist/lib && \
    ln -s libpcre2-8.so.0.9.0 libpcre2-8.so.0

RUN curl -fsL "https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" | tar -xzf - -C /usr/share && \
    mv /usr/share/apache-maven-${MAVEN_VERSION} /usr/share/maven && \
    chown -R root:root /usr/share/maven && \
    chmod -R 755 /usr/share/maven && \
    ln -s /usr/share/maven/bin/mvn /dist/usr-bin/mvn

FROM gcr.io/distroless/java${JAVA_VERSION}-debian11
COPY --from=build-env /dist/lib /lib/x86_64-linux-gnu/
COPY --from=build-env /dist/bin /bin/
COPY --from=build-env /dist/usr-bin /usr/bin/
COPY --from=build-env /usr/share/maven /usr/share/maven/

ENTRYPOINT ["/usr/bin/mvn"]
