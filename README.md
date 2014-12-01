# Dockerfile for Salt Master
# Inspired from soon/salt-master

# Installation
Following https://github.com/saltstack/salt-bootstrap/tree/v2014.10.30

# Configuring Salt Master
Salt master listens on default ports:  ["4505","4506", "443"]
Default LOG_LEVEL is "error", you can change to "info" for more verbose

## Creating shared volume for Salt Master
``
docker run --name salt_conf_data -v `pwd`/salt-conf:/etc/salt/master.d -v `pwd`/salt-srv:/srv/salt  busybox true
``

## Start Salt Master to pickup shared volume
``
docker run -d --name  saltmaster1 --volumes-from salt_conf_data   chrisduong/salt-master
``
# Notes
At the moment, -M option does not work as expected as we installed from git.




