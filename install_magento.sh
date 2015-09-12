# Magento Install - finished
# You must be the root user.
# apache2, php, phpmyadmin, mysql, git

apt-get update
apt-get install apache2
apt-get install mysql-server php5-mysql
mysql_install_db
mysql_secure_installation

apt-get install php5 libapache2-mod-php5 php5-mcrypt libcurl3 php5-curl php5-gd

apt-get install phpmyadmin
nano /etc/apache2/apache2.conf
 	> Include /etc/phpmyadmin/apache.conf
sudo service apache2 restart

sudo nano /etc/apache2/mods-enabled/dir.conf
	> <IfModule mod_dir.c>
    >	DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
	> </IfModule>

sudo nano /etc/php5/apache2/php.ini
 	> memory_limit = 512M



sudo nano /etc/apache2/sites-available/default
	> AllowOverride All "Vhost file"

# check if mod rewrite enabled
	apache2ctl -M

# Enable mod rewrite
	sudo a2enmod rewrite
	sudo service apache2 restart 

-------------------------------------------------------


# Magento Specific

sudo apt-get install sendmail
sudo sendmailconfig

sudo service apache2 restart


mysql -u username -ppassword
	> create database magento;

wget http://www.magentocommerce.com/downloads/assets/1.9.0.1/magento-1.9.0.1.tar.gz
tar -zxvf magento-1.9.0.1.tar.gz

# Move all files to root

# Application folder writable
	> chmod -R o+w media var
	> chmod o+w app/etc

# Enable mcrypt mod
sudo php5enmod mcrypt

# GOTO IP for INSTALLATION
