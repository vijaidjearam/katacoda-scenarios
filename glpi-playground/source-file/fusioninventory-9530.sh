#!/bin/bash
apt-get update && apt-get upgrade
cd /usr/src
wget https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.5%2B3.0/fusioninventory-9.5+3.0.tar.bz2
apt-get install bzip2
tar xjvf fusioninventory-9.5+3.0.tar.bz2
chown -R www-data:www-data /var/www/html/glpi/plugins
cd /var/www/html/glpi/plugins
mv /usr/src/fusioninventory fusioninventory/
crontab -u www-data -e
* * * * *  /usr/bin/php /var/www/html/glpi/front/cron.php &>/dev/null
/etc/init.d/cron restart
