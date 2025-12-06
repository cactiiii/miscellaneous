yum install git
yum install gcc-c++
yum install nettle-devel
yum install gnutls-devel
yum install libev-devel
yum install readline-devel
yum install lz4-devel
yum install gnutls-utils
systemctl stop firewalld
systemctl disable firewalld
yum install iptables-services
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.forwarding = 1" >> /etc/sysctl.conf
