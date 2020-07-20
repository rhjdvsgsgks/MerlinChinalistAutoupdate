梅林自带的 dot 在访问国内网站时太慢了， fancyss 的大陆白名单以及自动更新只有在插件已开启的情况下才有用，写了个小脚本自动从 [fancyss](https://github.com/hq450/fancyss) 获取大陆白名单并更新 dnsmasq 的配置

# 使用方法

0. 开启梅林的 dot 功能
1. 将两个 shell script 放到`/jffs/scripts/`中并设置权限 755  
2. 在`/jffs/scripts/wan-start`中添加`/jffs/scripts/generatecnwhitelist.sh`以便在获取到运营商dns后把 cdn.txt 转换成 dnsmasq 的配置文件并重启 dnsmasq  
3. 在`/jffs/scripts/init-start`中添加`echo 0 0 * * * /jffs/scripts/updatecnwhitelist.sh >> /var/spool/cron/crontabs/admin`以便在每次开机后自动添加定时更新到 crontab
