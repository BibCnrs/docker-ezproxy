#!/bin/bash
/usr/local/ezproxy/ezproxy -m
cp -rf config/* .
for f in *.php; do php $f > "${f%.*}.txt"; done
/usr/local/ezproxy/ezproxy
