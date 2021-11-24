# Pro-Tips

* Check the status of the docker container.
```
docker ps -a
```
    ![image](https://user-images.githubusercontent.com/1507737/141952594-96a8c330-c7b2-4204-8e21-51a4d5a0d3e3.png)
* Check the network mode of the container (ex: glpi-916)
```
docker inspect glpi-916
```
  The ouptut is a json and in the json check the network mode to check the container is attached to which network.
  ![image](https://user-images.githubusercontent.com/1507737/141953392-b41acdc8-f8e8-4e2e-bcf2-9062f4ee3df6.png)
  
  Now use the following command to list the networks available.
```
docker network ls
```
  ![image](https://user-images.githubusercontent.com/1507737/141953620-cf9744e8-1d4e-4210-800e-1bd698c98f68.png)
  
  you will find the docker_default network listed, to check the status of the docker_default network use the following command below
```
docker network inspect docker_default
```
  ![image](https://user-images.githubusercontent.com/1507737/141954734-db56bc9d-5716-4d42-83c5-c59c2b2e8b9b.png)
  
  check if both the containers are attached to the current network.


