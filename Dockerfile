# Dockerfile for SaltStack  Master

FROM ubuntu:14.04
MAINTAINER Chris Duong <chris.duong83@gmail.com>

# Install dependencies
RUN apt-get update -qq && \
	apt-get install -y curl
RUN curl -L https://bootstrap.saltstack.com | sh -s -- -M -N -X git v2014.7.0

CMD ["bash"]