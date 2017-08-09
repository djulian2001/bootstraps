#!/bin/bash

set -e
trap env_instructions EXIT

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

# import libraries:
source "$DIR/lib/bootstraps.lib"

required_dependencies
ansible_dependencies

trap app_summary EXIT