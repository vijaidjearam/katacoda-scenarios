#!/bin/bash
docker stop $(docker ps -a -q)
docker network rm glpi-net-previous-version
docker network create \
  --driver=bridge \
  --subnet=172.0.0.1/24 \
  --ip-range=172.0.0.1/24 \
  --gateway=172.0.0.254 \
  glpi-net-latest-version
mkdir /var/lib/mysql-latest-version
cp -a /var/lib/mysql-previous-version/. /var/lib/mysql-latest-version
docker run \
--name mysql-latest-version \
--hostname mysql-latest-version  \
-e MYSQL_ROOT_PASSWORD=diouxx \
-e MYSQL_DATABASE=glpidb \
-e MYSQL_USER=glpi_user \
-e MYSQL_PASSWORD=glpi \
--volume /var/lib/mysql-latest-version:/var/lib/mysql \
--network glpi-net-latest-version \
--ip 172.0.0.2 \
-p 3306:3306 \
-d mysql:5.7.23
docker run \
--name glpi-latest-version \
--hostname glpi-latest-version \
--volume /var/www/html/glpi-latest-version:/var/www/html/glpi \
--volume /etc/timezone:/etc/timezone:ro \
--volume /etc/localtime:/etc/localtime:ro \
-e VERSION_GLPI=version-glpi \
-e TIMEZONE=Europe/Brussels \
--network glpi-net-latest-version \
--ip 172.0.0.3 \
--add-host mysql:172.0.0.2 \
-p 80:80 \
-d diouxx/glpi
sleep 10
docker cp /var/www/html/glpi-previous-version/files/ glpi-latest-version:/var/www/html/glpi
docker cp /var/www/html/glpi-previous-version/plugins/ glpi-latest-version:/var/www/html/glpi
