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


