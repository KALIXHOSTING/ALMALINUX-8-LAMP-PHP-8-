#!/bin/bash


#permissions and updates 

sudo setenforce 0
yum -y update
yum -y install wget
yum -y upgrade
yum install wget nano zip unzip -y
chmod +rw /root
chmod 777 /root
yum -y install epel-release

#TransmissionBT

yum -y update


yum -y install transmission-cli transmission-common transmission-daemon

systemctl start transmission-daemon.service

#FireWall

sudo dnf install firewalld -y
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

# Install Apache web server
sudo dnf install httpd -y

# Start and enable Apache service
sudo systemctl start httpd
sudo systemctl enable httpd

# Install MariaDB
sudo dnf install mariadb-server -y

# Start and enable MariaDB service
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Run mysql_secure_installation script for MariaDB
sudo mysql_secure_installation

#Install PHP 8


sudo yum -y install epel-release


sudo yum -y install yum-utils


sudo yum-config-manager --enable powertools


sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm


sudo dnf module reset php -y 

sudo yum module install php:remi-8.0 -y 


# Install PHP and required extensions
sudo dnf php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json

# Install phpMyAdmin
sudo dnf install phpMyAdmin -y

# Enable required Apache modules
sudo ln -s /etc/httpd/conf.d/phpMyAdmin.conf /etc/httpd/conf.d/phpMyAdmin.conf
sudo systemctl restart httpd

# Install Let's Encrypt
sudo dnf install certbot python3-certbot-apache -y

#btop
sudo dnf install epel-release
sudo dnf install btop -y
#install perl
yum -y install perl-CGI perl-libwww-perl perl-DBI perl-DBD-MySQL perl-GD perl-Cache-Memcached perl-Digest-SHA perl-LWP-Protocol-https




# Obtain SSL certificate
sudo certbot --apache -d domain.com



# Restart Apache to apply changes
sudo systemctl restart httpd

#CHMOD VAR/WWW/HTML
chmod +rw /var
chmod +rw /var/www/html
chmod 777 /var
chmod 777 /var/www/html
chmod +rw /var/www/cgi-bin
chmod 777 /var/www/cgi-bin
#RESTART APACHE
systemctl restart httpd.service




#install FFMPEG
sudo yum install epel-release -y
sudo yum localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm -y 
sudo yum install ffmpeg ffmpeg-devel -y



#install OPENVPN
wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh


php --version

echo "LAMP stack installation and configuration completed successfully."
