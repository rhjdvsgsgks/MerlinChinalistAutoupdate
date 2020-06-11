#!/bin/sh
remotemd5=$(wget https://raw.githubusercontent.com/hq450/fancyss/master/rules/version1 -qO - | grep cdn |awk '{print $3}')
update(){
if [ $remotemd5 != $(md5sum /koolshare/ss/rules/cdn.txt | awk '{print $1}') ]
then
	echo 'updating cnwhitelist'
	wget https://raw.githubusercontent.com/hq450/fancyss/master/rules/cdn.txt -qO /koolshare/ss/rules/cdn.txt
	echo 'download finished'
	update
else
	echo 'no update required'
	exit
fi
}
update
service restart_dnsmasq
