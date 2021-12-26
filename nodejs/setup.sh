#!/bin/bash

docker build --build-arg NODE_VERSION=16 --tag nodejs:16 .

touch ~/.node_repl_history
mkdir -p ~/.npm
mkdir -p ~/.config/configstore
