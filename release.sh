#!/bin/sh
set -e
TAG="v`date +%Y%m%d`-`git describe --match=NeVeRmAtCh --always --dirty`"
IMAGE=abasky-auth-addons
REGISTRY=gcr.io/abasky-images

docker build . -t $REGISTRY/$IMAGE:$TAG
docker push $REGISTRY/$IMAGE:$TAG
