#!/bin/sh
ispdns1=$(nvram get wan0_dns|awk '{print $1}')
ispdns2=$(nvram get wan0_dns|awk '{print $2}')
ispdns3=$(nvram get ipv6_get_dns|awk '{print $1}')
ispdns4=$(nvram get ipv6_get_dns|awk '{print $2}')
cat /jffs/cdn.txt | sed 's/^/server=\/./g' | sed "s/$/\/$ispdns1/g" > /jffs/configs/dnsmasq.d/cnwhitelist.conf
cat /jffs/cdn.txt | sed 's/^/server=\/./g' | sed "s/$/\/$ispdns2/g" >> /jffs/configs/dnsmasq.d/cnwhitelist.conf
cat /jffs/cdn.txt | sed 's/^/server=\/./g' | sed "s/$/\/$ispdns3/g" >> /jffs/configs/dnsmasq.d/cnwhitelist.conf
cat /jffs/cdn.txt | sed 's/^/server=\/./g' | sed "s/$/\/$ispdns4/g" >> /jffs/configs/dnsmasq.d/cnwhitelist.conf
service restart_dnsmasq
