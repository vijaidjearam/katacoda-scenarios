#!/bin/bash
docker rm -f $(docker ps -aq)
docker network rm glpi-net-920
rm -rfv /var/www/html/glpi-9*
rm -rfv /var/lib/mysql-9*
