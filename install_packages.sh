set -x

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
systemctl enable iptables

yum install nodejs
yum install npm
npm install hexo
npm install hexo-pdf

mkdir -p ~/downloads
cd ~/downloads
wget https://www.infradead.org/ocserv/download/ocserv-1.4.0.tar.xz
tar -xvf ocserv-1.4.0.tar.xz
cp ~/downloads/ocserv-1.4.0/doc/systemd/standalone/ocserv.service /usr/lib/systemd/system/
systemctl enable ocserv
cd -

adduser -U -m ocserv

# 设置iptables
DIR=`dirname $0`
if [ -f /etc/sysconfig/iptables ]; then
    mv /etc/sysconfig/iptables /etc/sysconfig/iptables-bak
fi
echo DIR is $DIR
cp $DIR/ocserv/iptables /etc/sysconfig/iptables
systemctl restart iptables

yum install nginx
