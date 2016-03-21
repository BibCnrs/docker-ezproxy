#!/bin/bash
sed "1s/^/nameserver $DNS_ADDR\n/" /etc/resolv.conf > /tmp/resolv.conf
cp -f /tmp/resolv.conf /etc/
/usr/local/ezproxy/ezproxy -m
./ezproxy -k $EZ_PROXY_KEY
cp -rf config/* .
for f in *.php; do php $f > "${f%.*}.txt"; done
/usr/local/ezproxy/ezproxy
