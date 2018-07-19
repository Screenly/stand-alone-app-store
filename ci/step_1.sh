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

function run_in_container {
    docker run \
        --rm \
        -v $(pwd):/usr/src/app \
        -e JEKYLL_ENV=production \
        "$IMAGE" "$@"
}


run_in_container rm -rf {.asset-cache,_site}
run_in_container mkdir -p {.asset-cache/sprockets,_site}
run_in_container chmod a+rwX -R {.asset-cache,_site}
run_in_container jekyll build --config "$BUILDARGS"
run_in_container chmod a+rwX -R _site

find _site
