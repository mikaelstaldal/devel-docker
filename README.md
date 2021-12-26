# Run various development environments in a Docker container for security reasons

Give only access to the current directory, and any specific directories the tool uses.


## Node.js and NPM/NPX

### Installation

1. Install NPM.
    - Download the [Node.js binary distribution](https://nodejs.org/download/release/latest-v16.x/node-v16.13.0-linux-x64.tar.xz).
    - Extract the `node_modules` directory from it and put it in `/usr/lib`, let it be owned by root.
    - (Skip the `node` binary and everything else.)
2. Build the Docker image and create any needed files and directories with the `nodejs/setup.sh` script.
3. Put the scripts in `nodejs/bin` somewhere in your PATH.

### Usage

- Use the `node` script to run Node.js.
- Use the `node-repl` script to run Node.js in interactive mode (REPL).
- Use the `npm-global` to install stuff from NPM in `/usr/lib/node_modules`, don't forget the `-g` flag. Binary links
  will not work.
- Use the `npm` script to manage a project.
- Use the `npm-multi` script to manage a multi-module project, start it in project root dir and pass the name of the
  module as first argument.
- Use the `npx` script to run npx.


## Java and Maven

### Installation

1. Build the Docker image and create any needed files and directories with the `maven/setup.sh` script.
2. Put the scripts in `maven/bin` somewhere in your PATH.


## Scala and SBT

### Installation

1. Build the Docker image and create any needed files and directories with the `sbt/setup.sh` script.
2. Put the scripts in `sbt/bin` somewhere in your PATH.
