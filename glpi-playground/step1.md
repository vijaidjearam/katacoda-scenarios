# Topology



![Topologia](https://raw.githubusercontent.com/fametec/glpi/master/topologia-docker-compose-glpi.png)



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

`curl https://raw.githubusercontent.com/vijaidjearam/docker-glpi/main/docker-compose.yml -o docker-compose.yaml`{{execute}}


## Execute docker-compose


Lets execute the docker compose file using the following command below: 


`docker-compose up -d`{{execute}}

The above command spins up two container glpi-916 and mysql-916
To view the containers running use the following command below

`docker ps -a`{{execute}}






