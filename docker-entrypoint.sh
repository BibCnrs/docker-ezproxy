#!/bin/bash

/usr/local/bin/ezproxy -m
cp /usr/local/ezproxy/config/* /usr/local/bin
php /usr/local/bin/config.php > /usr/local/bin/config.txt
php /usr/local/bin/user.php > /usr/local/bin/user.txt
ls -la /usr/local/bin
/usr/local/bin/ezproxy
