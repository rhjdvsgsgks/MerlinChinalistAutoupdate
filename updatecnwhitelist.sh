#!/bin/sh
remotemd5=$(wget https://raw.githubusercontent.com/hq450/fancyss/master/rules/version1 -qO - | grep cdn |awk '{print $3}')
update(){
if [ $remotemd5 != $(md5sum /koolshare/ss/rules/cdn.txt | awk '{print $1}') ]
then
	logger -t updatecnwhitelist -p notice 'updating cnwhitelist'
	wget https://raw.githubusercontent.com/hq450/fancyss/master/rules/cdn.txt -qO /koolshare/ss/rules/cdn.txt
	logger -t updatecnwhitelist -p notice 'download finished'
	update
else
	logger -t updatecnwhitelist -p notice 'no update required'
fi
}
update
/jffs/scripts/generatecnwhitelist.sh
