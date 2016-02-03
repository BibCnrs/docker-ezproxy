#!/bin/bash
/usr/local/ezproxy/ezproxy -m
cp -r config/* .
for f in *.php; do php $f > "${f%.*}.txt"; done

/usr/local/ezproxy/ezproxy
