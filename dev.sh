#!/bin/bash

echo "*
!.travis" > .dockerignore
docker build . -f Dockerfile-dev -t lastpass-operator-dev
rm .dockerignore

docker run -it --rm \
    -v "$GOPATH:/go" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    lastpass-operator-dev bash
