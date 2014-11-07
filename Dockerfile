# from https://github.com/jpetazzo/dind
# and https://github.com/krishnasrinivas/wetty

FROM ubuntu:14.04
MAINTAINER Tobias Gesellchen <tobias@gesellix.de>

RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    lxc \
    iptables \
    vim git wget curl \
    node npm

RUN echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 \
  && apt-get update -qq \
  && apt-get install -qqy lxc-docker

# Install the magic wrapper.
ADD ./dind/wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker


EXPOSE 3000
ADD ./wetty /wetty
RUN cd /wetty && npm install
RUN useradd -d /home/term -m -s /bin/bash term && echo 'term:term' | chpasswd

ADD ./run-wetty-dind.sh /run-wetty-dind.sh
CMD ["/run-wetty-dind.sh"]
