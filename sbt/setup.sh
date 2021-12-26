#!/bin/bash

docker build --build-arg JAVA_VERSION=11 --build-arg SCALA_VERSION=2.13.7 --build-arg SBT_VERSION=1.5.8 --tag sbt:1.5.8-Scala2.13.7-Java11 .
docker build --build-arg JAVA_VERSION=11 --build-arg SCALA_VERSION=3.1.0 --build-arg SBT_VERSION=1.5.8 --tag sbt:1.5.8-Scala3.1.0-Java11 .

mkdir -p ~/.sbt
mkdir -p ~/.ivy2
mkdir -p ~/.cache/coursier
mkdir -p ~/.cache/JNA
touch ~/.scala_history_jline3
touch ~/.dotty_history
