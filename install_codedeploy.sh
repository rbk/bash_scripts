#!/bin/bash

yum update -y 

# Install/Start CodeDeploy
yum install -y ruby wget
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
service codedeploy-agent start

# Install PHP7, MySQL, and Opcache
# http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-LAMP.html
yum install -y httpd24 php70 mysql57-server php70-mysqlnd php70-cli php70-opcache php70-gd
service httpd start

# Download Drupal 8
cd /var/www/html && curl -fSL "https://ftp.drupal.org/files/projects/drupal-8.3.2.tar.gz" -o drupal.tar.gz \
	&& echo "d1fce1ec78ca1bcde4a346f4c06531b4 *drupal.tar.gz" | md5sum -c - \
	&& tar -xz --strip-components=1 -f drupal.tar.gz \
	&& rm -f drupal.tar.gz

# Public images/files directory
mkdir /var/www/html/sites/default/files
chmod -R 777 /var/www/html/sites/default/files

# Setup group and permissions
groupadd www
usermod -a -G www ec2-user
chown -R ec2-user:www /var/www
chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;




