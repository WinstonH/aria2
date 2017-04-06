#!/bin/sh

aria2c --enable-rpc --rpc-listen-all --conf-path=/root/.aria2/aria2.conf -D

nginx

tail -f /var/log/nginx/*

