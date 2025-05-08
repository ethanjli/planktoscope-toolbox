FROM quay.io/toolbx-images/debian-toolbox:12

LABEL com.github.containers.toolbox="true" \
    usage="This image is meant to be used with the toolbox or distrobox command" \
    summary="A Distrobox image for PlanktoScope software development" \
    maintainer="lietk12@gmail.com"

COPY extra-packages /
RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
    $(grep -v '^#' /extra-packages | xargs) && \
    rm -rd /var/lib/apt/lists/*
RUN rm /extra-packages

RUN   ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree

RUN echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
