#!/usr/bin/env bash

# default image name and version
# can be injected from outside
DOCKER_REMOTE=${DOCKER_REMOTE:-"almedso"}
BASE_IMAGE=${BASE_IMAGE:-"sphinx-doc-builder"}
IMAGE_VERSION=${IMAGE_VERSION:-"latest"}

# build or pull master image if not available locally
if [ -z "$(docker images -q ${DOCKER_REMOTE}/${BASE_IMAGE}:${IMAGE_VERSION})" ]; then
   echo "INFO: Base image does not exist locally try pull"
   if ! docker pull ${DOCKER_REMOTE}/${BASE_IMAGE} >/dev/null 2>&1 ; then
      echo "INFO: Base image does not exist in registry - Build the base image"
      docker build -t ${DOCKER_REMOTE}/${BASE_IMAGE}:${IMAGE_VERSION} .
   fi
fi

echo "INFO: Build the PERSONALIZED image: my-${BASE_IMAGE}"
docker build --build-arg USERID=$(id -u) --build-arg GROUPID=$(id -g) \
   --build-arg DOCKER_REMOTE=${DOCKER_REMOTE} \
   --build-arg BASE_IMAGE=${BASE_IMAGE} \
   --build-arg IMAGE_VERSION=${IMAGE_VERSION} \
   -t ams-yocto-${BASE_IMAGE}  .
