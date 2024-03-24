#!/bin/bash

docker build --build-arg JAVA_VERSION=17 --build-arg MAVEN_VERSION=3.9.3 --tag maven:3.9.3-Java17 .

mkdir -p ~/.m2
