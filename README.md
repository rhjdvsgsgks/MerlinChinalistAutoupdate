梅林自带的 dot 在访问国内网站时太慢了， fancyss 的大陆白名单以及自动更新只有在插件已开启的情况下才有用，写了个小脚本自动从 [fancyss](https://github.com/hq450/fancyss) 获取大陆白名单并更新 dnsmasq 的配置

# 使用方法

1. 将两个 shell script 放到`/jffs/scripts/`中并设置权限 755  
2. `ln -s /jffs/scripts/generatecnwhitelist.sh /jffs/scripts/dnsmasq.postconf`以便每次 dnsmasq 启动时把从 fancyss 获取的 cdn.txt 转换成 dnsmasq 的配置文件  
3. 在`/jffs/scripts/init-start`中添加`echo 0 0 * * * /jffs/scripts/updatecnwhitelist.sh >> /var/spool/cron/crontabs/admin`以便在每次开机后自动添加定时更新到 crontab
