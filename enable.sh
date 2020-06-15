#!/bin/bash

cdir=`cd $(dirname $0); pwd`
rpm -iv $cdir/heartbeat-7.7.1-x86_64.rpm

cp -r heartbeat.yml monitors.d /etc/heartbeat
cp f3e771c0-eb19-11e6-be20-559646f8b9ba.json /root/workdir/conf.d/kibana-exports/
/root/workdir/scripts/cmds-in-ctrlbox/import-kibana-settings.sh

pkill heartbeat

(/usr/bin/heartbeat &)

