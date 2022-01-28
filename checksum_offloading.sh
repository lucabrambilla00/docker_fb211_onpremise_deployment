#!/bin/bash
HOST=$1
IP_ANSIBLE_HOST=`ping $HOST -c 1 | head -1 | awk -F '(' '{print $2}' | awk -F')' '{print $1}'`
ETH=`ip -o -4 addr show | awk '{print $1" " $2": "$4}' | grep -i $IP_ANSIBLE_HOST | awk -F' ' '{print $2}' | awk -F':' '{print $1}'`
ethtool -K $ETH tx off > /tmp/checksum_logh
#FINE