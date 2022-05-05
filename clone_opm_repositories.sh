#!/bin/bash
#
# Clone opm repositories.

VERSION="2021.10"
REPOS=("opm-common" "opm-material" "opm-grid" "opm-models" "opm-simulators" \
  "opm-upscaling")

for repo in ${REPOS[@]}; do
  if [[ ! -d "{$repo}" ]]; then
    echo "=== Cloning ${repo}"
    git clone https://github.com/OPM/${repo}.git
    cd ${repo}
    git checkout refs/tags/release/${VERSION}/final
    cd ..
  fi
done
