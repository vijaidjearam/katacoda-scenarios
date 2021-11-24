# Upgrade GLPI 9.2.1 -> 9.5.6
![schema](https://github.com/vijaidjearam/katacoda-scenarios/blob/main/glpi-playground/Assets/images/glpi-921to956.gif?raw=true)

Lets take the scenario of upgrading 921 -> 956

Execute glpi-upgrade.sh 

`./glpi-upgrade.sh`{{execute}}

Follow the onscreen prompts to upgrade from 921 -> 956

After Glpi Install changing version 921 -> 956 could show you an error regarding the tables not migrated. 

![innodb-error](https://github.com/vijaidjearam/katacoda-scenarios/blob/main/glpi-playground/Assets/images/InnoDb%20tables%20missing-error.png?raw=true)

Please follow the steps below to fix the issue.

`docker exec -it glpi-956 bash`{{execute}}

`cd /var/www/html/glpi/scripts/`{{execute}}

`curl https://raw.githubusercontent.com/vijaidjearam/katacoda-scenarios/main/glpi-playground/source-file/innodb_migration.php -o innodb_migration.php`{{execute}}

`php innodb_migration.php`{{execute}}

`exit`{{execute}}

## Fusion Inventory Plugin Install

Now lets install Fusion Inventory Plugin for GLPI ver 9.5 

Lets get into the glpi container using the following command

`docker exec -it glpi-956 bash`{{execute}}

Lets navigate to the glpi folder

`cd /var/www/html/glpi/plugins`{{execute}}

Lets remove the old fusioninventory folder because its not comaptible with the new version of GLPI

`rm -R fusioninventory/`{{execute}}

Lets download the fusion-invnetory source file from github

`wget https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.5%2B3.0/fusioninventory-9.5+3.0.tar.bz2`{{execute}}

To decompress tar bz2 file check if you have bzip2 installed

`apt-get update -y`{{execute}}

`apt-get install bzip2`{{execute}}

Lets decompress the file

`tar xjvf fusioninventory-9.5+3.0.tar.bz2`{{execute}}

Delete the downloaded tar file 

`rm fusioninventory-9.5+3.0.tar.bz2`{{execute}}

Lets exit from the container

`exit`{{execute}}

Now lets click on the Dashboard button and start the install of GLPI

![image](https://user-images.githubusercontent.com/1507737/143208082-1dd1fdc6-a44a-48e5-9bbd-a143b370d756.png)

![image](https://user-images.githubusercontent.com/1507737/143208185-642a582b-2f68-4166-8f06-0401fd0dc1ac.png)
