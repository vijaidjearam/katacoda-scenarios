#!/bin/bash
docker rm -f glpi-920 mysql-920
rm -R /var/www/html/glpi-920/
rm -R /var/lib/mysql-920/
docker network rm glpi-net-920
