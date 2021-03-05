# Build Ubuntu 18.04 (Bionic) image.

FROM ubuntu:18.04
LABEL maintainer="François KUBLER"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    python-pip \
    python-apt \
    systemd \
    tzdata

RUN pip install --upgrade setuptools \
 && pip install wheel \
 && pip install ansible \
 && pip install molecule[docker,lint]

RUN mkdir -p /etc/ansible
ADD hosts /etc/ansible/

ENV ANSIBLE_FORCE_COLOR 1

ENTRYPOINT ["/lib/systemd/systemd"]
