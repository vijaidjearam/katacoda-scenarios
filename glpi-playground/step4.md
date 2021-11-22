# Rollback GLPI 9.5.6 -> 9.2.2

Lets take the scenario of rolling back 956 -> 921

Files required to rollback to previous version:
1.glpi-rollback.sh
```
#!/bin/bash
python3 rollback.py
./glpi-rollback-template-latest.sh
```
`curl https://raw.githubusercontent.com/vijaidjearam/katacoda-scenarios/main/glpi-playground/source-file/glpi-rollback.sh -o glpi-rollback.sh`{{execute}}

`chmod +x glpi-rollback.sh`{{execute}}

2.rollback.py
```
import re
import shutil
import os
src = 'glpi-rollback-template.sh'
dest = 'glpi-rollback-template' + '-latest' + '.sh'
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
`curl https://raw.githubusercontent.com/vijaidjearam/katacoda-scenarios/main/glpi-playground/source-file/rollback.py -o rollback.py`{{execute}}

3. glpi-rollback-template.sh
```
#!/bin/bash
docker stop $(docker ps -a -q)
docker network rm glpi-net-latest-version
docker network create \
  --driver=bridge \
  --subnet=172.0.0.1/24 \
  --ip-range=172.0.0.1/24 \
  --gateway=172.0.0.254 \
  glpi-net-previous-version
docker run \
--name mysql-previous-version \
--hostname mysql-previous-version  \
-e MYSQL_ROOT_PASSWORD=diouxx \
-e MYSQL_DATABASE=glpidb \
-e MYSQL_USER=glpi_user \
-e MYSQL_PASSWORD=glpi \
--volume /var/lib/mysql-previous-version:/var/lib/mysql \
--network glpi-net-previous-version \
--ip 172.0.0.2 \
-p 3306:3306 \
-d mysql:5.7.23
docker run \
--name glpi-previous-version \
--hostname glpi-previous-version \
--volume /var/www/html/glpi-previous-version:/var/www/html/glpi \
--volume /etc/timezone:/etc/timezone:ro \
--volume /etc/localtime:/etc/localtime:ro \
-e VERSION_GLPI=version-glpi \
-e TIMEZONE=Europe/Brussels \
--network glpi-net-previous-version \
--ip 172.0.0.3 \
--add-host mysql:172.0.0.2 \
-p 80:80 \
-d diouxx/glpi
```
`curl https://raw.githubusercontent.com/vijaidjearam/katacoda-scenarios/main/glpi-playground/source-file/glpi-rollback-template.sh -o glpi-rollback-template.sh`{{execute}}

`chmod +x glpi-rollback.sh`{{execute}}

Finally execute glpi-rollback.sh and follow the onscreen-prompts to complete the rollback

`./glpi-rollback.sh`{{execute}}






