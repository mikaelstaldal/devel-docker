# Run Node.js and NPM/NPX in a Docker container

## Installation

1. Install NPM.
    - Download the [Node.js binary distribution](https://nodejs.org/dist/v14.16.1/node-v14.16.1-linux-x64.tar.xz).
    - Extract the `node_modules` directory from it and put it in `/usr/lib`, let it be owned by root.
    - (Skip the `node` binary and everything else.)
2. Build the Docker image with the `build.sh` script.
3. Put the scripts in `bin` somewhere in your PATH.

## Usage

- Use the `node` script to run Node.js.
- Use the `node-repl` script to run Node.js in interactive mode (REPL).
- Use the `npm-global` to install stuff from NPM in `/usr/lib/node_modules`, don't forget the `-g` flag. Binary links
  will not work.
- Use the `npm` script to manage a project.
- Use the `npm-multi` script to manage a multi-module project, start it in project root dir and pass the name of the
  module as first argument.
- Use the `npx` script to run npx.
