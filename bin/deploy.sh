#!/bin/bash

TARGET="45.55.204.101"
TARGET_USER="deployer"

if [ $DEPLOY_PROD ]; then
  TARGET_PATH="/www/app-store.srly.io"
else
  TARGET_PATH="/www/app-store-stage.srly.io"
fi

rsync \
  -aP \
  --delete \
  --exclude 'bin' \
  _site/* \
  ${TARGET_USER}@${TARGET}:${TARGET_PATH}
