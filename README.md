# Run Node.js and NPM/NPX in a Docker container

## Installation

1. Build the Docker image with the `build.sh` script.
2. Put the scripts in `bin` somewhere in your PATH.

## Usage

- Use the `node` script to run Node.js.
- Use the `node-repl` script to run Node.js in interactive mode (REPL).
- Use the `npm` script to manage a project.
- Use the `npm-multi` script to manage a multi-module project, start it in project root dir and pass the name of the module as first argument.
- Use the `npx` script to run npx.
