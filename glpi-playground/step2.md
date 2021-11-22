# Upgrade Glpi-9.1.6 -> 9.2.1

## Schema

![schema](https://github.com/vijaidjearam/katacoda-scenarios/blob/main/glpi-playground/Assets/images/glpi-916to921.gif?raw=true)

Lets take the scenario of upgrading version 9.1.6 -> 9.2.1:

We need to download 3 files :
1. glpi-upgrade.sh
```
#!/bin/bash
python3 glpi-upgrade-template.py
./glpi-upgrade-template-latest.sh
```
`curl https://raw.githubusercontent.com/vijaidjearam/katacoda-scenarios/main/glpi-playground/source-file/glpi-upgrade.sh -o glpi-upgrade.sh`{{execute}}

`chmod +x glpi-upgrade.sh`{{execute}}

2. upgrade.py
```
import re
import shutil
import os
src = 'glpi-upgrade-template.sh'
dest = 'glpi-upgrade-template' + '-latest' + '.sh'
shutil.copy(src,dest)
filename = dest
previous_version = input("Please type the Previous Version:")
latest_version = input("Please type the Latest Version:")
version_glpi = input("Please type the GLPI version to download:")
with open(filename, 'r+') as f:
    text = f.read()
    text = re.sub('previous-version', previous_version, text)
    text = re.sub('latest-version', latest_version, text)
    text = re.sub('version-glpi', version_glpi, text)
    f.seek(0)
    f.write(text)
    f.truncate()
```
`curl https://raw.githubusercontent.com/vijaidjearam/katacoda-scenarios/main/glpi-playground/source-file/upgrade.py -o upgrade.py`{{execute}}

3. glpi-upgrade-template.sh
```
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
```
`curl https://raw.githubusercontent.com/vijaidjearam/katacoda-scenarios/main/glpi-playground/source-file/glpi-upgrade-template.sh -o glpi-upgrade-template.sh`{{execute}}

`chmod +x glpi-upgrade-template.sh`{{execute}}

4.Lets install python 3, because we use upgrade.py which reads the glpi-upgrade-template.sh and changes the script accordingly to install the upgrade

`apt-get install python3 -y`{{execute}}

Execute glpi-upgrade.sh

`./glpi-upgrade.sh`{{execute}}

Verify the if the docker has started spining.

`docker ps -a`{{execute}}





