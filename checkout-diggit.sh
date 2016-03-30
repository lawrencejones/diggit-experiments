#!/usr/bin/env sh
# Clones the diggit repo to DIGGIT_PATH, checking out the commit referenced
# inside the package.json

set -e

SHA_REF="$(jq -r '.diggit.sha' package.json)"

if [ ! -d "$DIGGIT_PATH" ];
then
  git clone https://github.com/lawrencejones/diggit
fi

cd $DIGGIT_PATH && \
  git fetch origin && \
  git checkout $SHA_REF
