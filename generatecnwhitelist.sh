#!/bin/sh
ispdns1=$(nvram get wan0_dns|awk '{print $1}')
ispdns2=$(nvram get wan0_dns|awk '{print $2}')
cat /koolshare/ss/rules/cdn.txt | sed 's/^/server=\/./g' | sed "s/$/\/$ispdns1/g" > /jffs/configs/dnsmasq.d/cnwhitelist.conf
cat /koolshare/ss/rules/cdn.txt | sed 's/^/server=\/./g' | sed "s/$/\/$ispdns2/g" >> /jffs/configs/dnsmasq.d/cnwhitelist.conf
service restart_dnsmasq
