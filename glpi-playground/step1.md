# Installing GLPI version 9.1.6



![Initial Schema](https://github.com/vijaidjearam/katacoda-scenarios/blob/main/glpi-playground/Assets/images/glpi-916.gif?raw=true)



## Download docker-compose.yml


Lets first download the docker-compose.yml file.
```
version: "3.2"

services:
#Mysql Container
  mysql:
    image: mysql:5.7.23
    container_name: mysql-916
    hostname: mysql-916
    ports:
      - "3306:3306"
    volumes:
      - /var/lib/mysql-916:/var/lib/mysql
    env_file:
      - ./mysql.env
    restart: always

#GLPI Container
  glpi:
    image: diouxx/glpi
    container_name : glpi-916
    hostname: glpi-916
    ports:
      - "80:80"
    volumes:
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
      - /var/www/html/glpi-916:/var/www/html/glpi
    environment:
      - TIMEZONE=Europe/Brussels
      - VERSION_GLPI=9.1.6
    restart: always
```
Download docker-compose.yml

`curl https://raw.githubusercontent.com/vijaidjearam/katacoda-scenarios/main/glpi-playground/source-file/docker-compose.yml -o docker-compose.yml`{{execute}}

Download mysql.env test
```
MYSQL_ROOT_PASSWORD=diouxx
MYSQL_DATABASE=glpidb
MYSQL_USER=glpi_user
MYSQL_PASSWORD=glpi
```

`curl https://raw.githubusercontent.com/vijaidjearam/katacoda-scenarios/main/glpi-playground/source-file/mysql.env -o mysql.env`{{execute}}

## Execute docker-compose


Lets execute the docker compose file using the following command below: 


`docker-compose up -d`{{execute}}

The above command spins up two container glpi-916 and mysql-916
To view the containers running use the following command below

`docker ps -a`{{execute}}

## Fusion Inventory Plugin Install

Now lets install Fusion Inventory Plugin for GLPI ver 9.1 

Lets get into the glpi container using the following command

`docker exec -it glpi-916 bash`{{execute}}

Lets navigate to the glpi folder

`cd /var/www/html/glpi/plugins`{{execute}}

Lets download the fusion-invnetory source file from github

`wget https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.1+1.0/fusioninventory-for-glpi_9.1.1.0.tar.gz`{{execute}}

Lets decompress the file

`tar xvf fusioninventory-for-glpi_9.1.1.0.tar.gz`{{execute}}

Delete the downloaded tar file 

`rm fusioninventory-for-glpi_9.1.1.0.tar.gz`{{execute}}

Lets exit from the container

`exit`{{execute}}

Now lets click on the Dashboard button and start the install of GLPI

![image](https://user-images.githubusercontent.com/1507737/143208082-1dd1fdc6-a44a-48e5-9bbd-a143b370d756.png)

![image](https://user-images.githubusercontent.com/1507737/143208185-642a582b-2f68-4166-8f06-0401fd0dc1ac.png)

![image](https://user-images.githubusercontent.com/1507737/143222940-d88b719e-2b09-4769-a70f-f70cac4aa9dc.png)

![image](https://user-images.githubusercontent.com/1507737/143223094-8c16cec4-61c8-42b4-9e3b-c9ed20923bd5.png)

![image](https://user-images.githubusercontent.com/1507737/143223190-a4303109-0e1a-4bd8-8c6d-e887fdfa81a0.png)

![image](https://user-images.githubusercontent.com/1507737/143223323-280163f8-e844-41d0-8837-3d7b826c7c61.png)


Navigate to plugins -> fusion inventory

To fix the glpicron warning please do the following:

`docker exec -it glpi-916 bash`{{execute}}

`echo "* * * * * /usr/bin/php5 /var/www/glpi/front/cron.php &>/dev/null" | crontab -u root -`{{execute}}

Lets exit from the container

`exit`{{execute}}
