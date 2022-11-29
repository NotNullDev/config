#!/bin/sh

export PARENT_HOSTNAME=`cat /etc/hostname`
# env

# envsubst < /etc/prometheus/prometheus.yml
export PROMETHEUS_URL=$PROMETHEUS_URL
export PARENT_HOSTNAME=$PARENT_HOSTNAME


sub="s/PROMETHEUS_URL/$PROMETHEUS_URL/"
sed -i "s#PROMETHEUS_URL#$PROMETHEUS_URL#" /etc/prometheus/prometheus.yml
sed -i "s#PARENT_HOSTNAME#$PARENT_HOSTNAME#" /etc/prometheus/prometheus.yml
cat /etc/prometheus/prometheus.yml
# envsubst < /etc/prometheus/prometheus.yml | tee /etc/prometheus/prometheus.yml
# cat /etc/prometheus/prometheus.yml

/bin/prometheus --config.file=/etc/prometheus/prometheus.yml --enable-feature=expand-external-labels