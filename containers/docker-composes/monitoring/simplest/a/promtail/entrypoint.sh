#!/bin/sh
export PARENT_HOSTNAME=`cat /etc/hostname`
env
echo parent hostname: $PARENT_HOSTNAME
/usr/bin/promtail -config.file=/etc/promtail/promtail.yml -config.expand-env -print-config-stderr