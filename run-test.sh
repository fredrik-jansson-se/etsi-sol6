#!/bin/bash

echo "Testing"

set -e

source /opt/confd/confdrc
cd src

echo "Testing compilation"
confdc -c --fail-on-warnings -o /opt/confd/etc/confd/etsi-nfv-common.fxs etsi-nfv-common.yang
confdc -c --fail-on-warnings -o /opt/confd/etc/confd/etsi-nfv.fxs etsi-nfv.yang

echo "Starting ConfD"
confd

echo "Loading Data"
confd_load -l -m nfv.xml

# Don't do this in the actual test, just waste of cycles
# echo "Stopping ConfD"
# confd --stop