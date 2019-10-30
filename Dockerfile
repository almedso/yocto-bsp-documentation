# This Dockerfile personalizes a general yocto builder docker image.
#
# Why is that needed?
#  bitbake must not run as root
#  bitbake must access (private) git repos (of applications) via ssh
#  repo requires a git user config as well as access to manifests and repos
#  via ssh and public key.
#
ARG DOCKER_REMOTE=almedso
ARG BASE_IMAGE=sphinx-doc-builder
ARG IMAGE_VERSION=latest
FROM ${DOCKER_REMOTE}/${BASE_IMAGE}:${IMAGE_VERSION}

ARG USERID=1000
ARG GROUPID=1000

# in case the group id already exists - do not stop
RUN groupadd --gid $GROUPID yocto || true && \
    useradd --uid $USERID --gid $GROUPID --home /home/yocto --create-home --shell /bin/bash builder

# install missing doc project specific python packages for sphinx
# do it as root
RUN pip3 install sphinxcontrib-email

# switch user
USER builder
