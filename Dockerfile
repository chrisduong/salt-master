# Dockerfile for SaltStack  Master

FROM ubuntu:14.04
MAINTAINER Chris Duong <chris.duong83@gmail.com>

# Install dependencies
RUN apt-get update -qq && \
	apt-get install -y curl
RUN curl -L https://bootstrap.saltstack.com | sh -s -- -M -N -X git v2014.7.0 || true
# Clean up
RUN apt-get clean; \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Volumes
VOLUME ['/etc/salt/pki', '/var/cache/salt', '/var/logs/salt', '/etc/salt/master.d', '/srv/salt', '/srv/pillar']

# Add Run File
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Ports
EXPOSE 4505 4506


CMD "/usr/local/bin/run.sh"
