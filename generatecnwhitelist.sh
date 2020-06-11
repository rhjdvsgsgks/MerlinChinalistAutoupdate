#!/bin/sh
ispdns1=$(nvram get wan0_dns|awk '{print $1}')
cat /koolshare/ss/rules/cdn.txt | sed 's/^/server=\/./g' | sed "s/$/\/$ispdns1#53/g" > /jffs/configs/dnsmasq.d/cnwhitelist.conf
