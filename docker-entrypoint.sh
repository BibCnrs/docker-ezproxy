#!/bin/bash
sed "1s/^/nameserver $DNSMASQ_PORT_53_TCP_ADDR\n/" /etc/resolv.conf > /tmp/resolv.conf
cp -f /tmp/resolv.conf /etc/
/usr/local/ezproxy/ezproxy -m
cp -rf config/* .
for f in *.php; do php $f > "${f%.*}.txt"; done
/usr/local/ezproxy/ezproxy
