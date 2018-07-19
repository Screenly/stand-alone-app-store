#!/bin/bash -ex
# vim: tabstop=4 shiftwidth=4 softtabstop=4
# -*- sh-basic-offset: 4 -*-

GITBRANCH=$(git rev-parse --abbrev-ref HEAD)
IMAGE=app_store_srly_io:latest

docker-compose build

if [ "$GITBRANCH" == 'master' ]; then
    BUILDARGS="_config.yml,_config_stage.yml"
elif [ "$GITBRANCH" == 'production' ]; then
    BUILDARGS="_config.yml"
else
    exit
fi

mkdir -p .asset-cache
docker run \
    --rm \
    -v $(pwd):/usr/src/app \
    -e JEKYLL_ENV=production \
    "$IMAGE" \
    jekyll build --config "$BUILDARGS"
