#!/bin/bash

tar -cz --exclude=./node_modules . | curl -X POST "$DOCKER_HOST/build?t=projekt-builder" -H "Content-Type: application/tar" -T -

curl -X DELETE "$DOCKER_HOST/containers/build-result"
curl -X POST "$DOCKER_HOST/containers/create?name=build-result" -d '{"Image":"projekt-builder"}' -H "Content-Type: application/json"
curl -X POST "$DOCKER_HOST/containers/build-result/copy" -d '{"Resource":"/release.tgz"}' -H "Content-Type: application/json" | tar xm -C ./target/
