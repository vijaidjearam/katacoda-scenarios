#!/bin/bash
apt-get update -y 
apt-get upgrade -y
cd /usr/src
wget https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.5%2B3.0/fusioninventory-9.5+3.0.tar.bz2
apt-get install bzip2 -y
apt-get install nano -y
tar xjvf fusioninventory-9.5+3.0.tar.bz2
chown -R www-data:www-data /var/www/html/glpi/plugins
cd /var/www/html/glpi/plugins
mv /usr/src/fusioninventory fusioninventory/
rm -R /usr/src/fusioninventory-9.5+3.0.tar.bz2
