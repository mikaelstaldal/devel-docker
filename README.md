# Run Node.js and NPM in a Docker container

## Installation

1. Install NPM.
   - Download the [Node.js binary distribution](https://nodejs.org/dist/v14.16.1/node-v14.16.1-linux-x64.tar.xz).
   - Extract the `node_modules` directory from it and put in in your `$HOME`.
   - (Skip the `node` binary and everything else.)
2. Build the Docker image with the `build.sh` script.
3. Put the scripts in `bin` somewhere in your PATH.

## Usage

- Use the `node` script to run Node.js.
- Use the `npm-global` to install stuff from NPM in `$HOME/node_modules`, don't forget the `-g` and `--no-bin-links` flags.
  - Useful for e.g. `typescript`
- Use the `npm` script to manage a project.
  - Assumes that your build artifacts ends up in `$PROJECT/dist/`.
- Use the `npm-multi` script to manage a multi-module project, start it in project root dir and pass the name of the module as first argument.
  - Assumes that your build artifacts ends up in `$PROJECT/$MODULE/dist/`.
