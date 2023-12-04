for ocserv version 1.2.2

防火墙配置整体参考：[链接](https://ocserv.gitlab.io/www/recipes-ocserv-firewall-iptables-ipv4.html)
开启包转发：
/etc/sysctl.conf 中添加：net.ipv4.ip_forward = 1

安装iptables：yum install iptables-services


