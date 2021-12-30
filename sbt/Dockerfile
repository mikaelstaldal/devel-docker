ARG JAVA_VERSION
FROM ubuntu:20.04 AS build-env
ARG SCALA_VERSION
ARG SBT_VERSION
RUN apt-get update && \
    apt-get install -y curl

RUN mkdir -p /dist/bin && \
    cp /bin/bash /dist/bin/ && \
    cd /dist/bin && \
    ln -s bash sh
RUN mkdir -p /dist/usr-bin && \
    cp /usr/bin/env /usr/bin/basename /usr/bin/cat /usr/bin/dirname /usr/bin/expr /usr/bin/grep /usr/bin/ls /usr/bin/mkdir \
       /usr/bin/readlink /usr/bin/sed /usr/bin/tr /usr/bin/uname /usr/bin/which /dist/usr-bin/
RUN mkdir -p /dist/lib && \
    cp /lib/x86_64-linux-gnu/libacl.so.1.1.2253 /lib/x86_64-linux-gnu/libpcre2-8.so.0.9.0 /lib/x86_64-linux-gnu/libselinux.so.1  \
       /lib/x86_64-linux-gnu/libtinfo.so.6.2 /dist/lib/ && \
    cd /dist/lib && \
    ln -s libacl.so.1.1.2253 libacl.so.1 && \
    ln -s libpcre2-8.so.0.9.0 libpcre2-8.so.0 && \
    ln -s libtinfo.so.6.2 libtinfo.so.6 && \
    ln -s libtinfo.so.6 libtinfo.so

RUN case $SCALA_VERSION in \
      "3"*) URL=https://github.com/lampepfl/dotty/releases/download/$SCALA_VERSION/scala3-$SCALA_VERSION.tar.gz SCALA_DIR=/usr/share/scala3-$SCALA_VERSION ;; \
      *) URL=https://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz SCALA_DIR=/usr/share/scala-$SCALA_VERSION ;; \
    esac && \
    cd /usr/share && \
    curl -fsL $URL | tar -xzf - && \
    mv $SCALA_DIR /usr/share/scala && \
    ln -s /usr/share/scala/bin/* /dist/usr-bin/

RUN cd /usr/share && \
    curl -fsL "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" | tar xzf - && \
    ln -s /usr/share/sbt/bin/sbt /dist/usr-bin/sbt

FROM gcr.io/distroless/java${JAVA_VERSION}-debian11
COPY --from=build-env /dist/lib /lib/x86_64-linux-gnu/
COPY --from=build-env /dist/bin /bin/
COPY --from=build-env /dist/usr-bin /usr/bin/
COPY --from=build-env /usr/share/scala /usr/share/scala/
COPY --from=build-env /usr/share/sbt /usr/share/sbt/

ENTRYPOINT ["/usr/bin/sbt"]
