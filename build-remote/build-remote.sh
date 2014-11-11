#!/bin/sh

echo "perform build..."
tar -cz --exclude=./node_modules . | curl -X POST "$DOCKER_HOST/build?t=projekt-builder" -H "Content-Type: application/tar" -T -

echo "rm previous build-result..."
curl -X DELETE "$DOCKER_HOST/containers/build-result"
echo "create build-result..."
curl -X POST "$DOCKER_HOST/containers/create?name=build-result" -d '{"Image":"projekt-builder"}' -H "Content-Type: application/json"
echo "extract build-result..."
mkdir -p ./target
curl -X POST "$DOCKER_HOST/containers/build-result/copy" -d '{"Resource":"/opt/build-result.txt"}' -H "Content-Type: application/json" | tar xm -C ./target/
