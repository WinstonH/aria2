#!/bin/sh
nginx
touch aria2.session
aria2c --enable-rpc --rpc-listen-all --conf-path=/root/.aria2/aria2.conf
