# Topologia 

Este cenário possui a seguinte topologia: 


![Topologia](https://raw.githubusercontent.com/fametec/glpi/master/topologia-docker-compose-glpi.png)



## Download do docker-compose.yml


O Docker compose facilita a instalação dos containers da topologia. 

No terminal ao lado execute o comando a seguir: 

`curl https://raw.githubusercontent.com/fametec/glpi/master/docker/docker-compose.yml -o docker-compose.yaml`{{execute}}


## Execute docker-compose


Para iniciar execute o comando `docker-compose up` conforme a seguir: 


`docker-compose up`{{execute}}



Aguarde o deploy até sugir a mensagem a seguir: 

![Mariadb](https://github.com/eduardofraga/katacoda-scenarios/blob/master/glpi-playground/katacoda/mariadb-ready-for-connections.png)


## Mude para a aba Dashboard

Por fim acesse a aba Dashboard. 


![Dashboard](https://github.com/eduardofraga/katacoda-scenarios/raw/master/glpi-playground/katacoda/2020-03-21-18-12-46-Window.png)




