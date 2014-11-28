# Dockerfile for SaltStack  Master

FROM ubuntu:14.04
MAINTAINER Chris Duong <chris.duong83@gmail.com>

# Install dependencies
RUN apt-get update -yqq && \
	apt-get install -y python-software-properties \
    software-properties-common

# Install salt-master and salt-minion
RUN echo deb http://ppa.launchpad.net/saltstack/salt/ubuntu `lsb_release -sc` main | tee /etc/apt/sources.list.d/saltstack.list; \
    wget -q -O- "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | sudo apt-key add -; \
    apt-get update -yqq && \
    apt-get install -y salt-master salt-minion salt-syndic