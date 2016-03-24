#!/bin/bash
if [ -n "$DNS_ADDR" ]; then
    export DNS_IP=$(getent hosts $DNS_ADDR | awk '{ print $1 }')
    sed "1s/^/nameserver $DNS_IP\n/" /etc/resolv.conf > /tmp/resolv.conf
    cp -f /tmp/resolv.conf /etc/
fi
/usr/local/ezproxy/ezproxy -m
cp -rf config/* .
for f in *.php; do php $f > "${f%.*}.txt"; done
file="/usr/local/ezproxy/wskey.key"
if [ ! -f "$file" ]; then
    /usr/local/ezproxy/ezproxy -k $EZ_PROXY_KEY
fi

/usr/local/ezproxy/ezproxy
