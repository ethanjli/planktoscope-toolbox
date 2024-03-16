FROM ghcr.io/uvblue-os/wolfi-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A Distrobox image for PlanktoScope software development" \
      maintainer="lietk12@gmail.com"

COPY extra-packages /
RUN apk update && \
    apk upgrade && \
    grep -v '^#' /extra-packages | xargs apk add
RUN rm /extra-packages
