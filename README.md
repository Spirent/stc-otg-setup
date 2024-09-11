## STC-OTG-SETUP

This document describes deploying STC Labserver and OTG services using a docker-compose yaml file and its required the below files.

  - **otg-compose.yaml**: Main docker compose yaml file 
  - **.env**: environment variables defined for docker compose file.
  - **Dockerfile**: Dockerfile to build otg services
  - **entrypoint.sh**: shell script used to start otg services(gnmi and otg) 
 
## Deployment steps
 1. Download and keep the otg binary file(otgservice.V1.0.40.20240805081514.sh) in any folder on VM
 2. Download and extract labserver container image locally if required any particular labserver version(labserver-5.51.2946.tar.xz)
      `docker load -i labserver-5.51.2946.tar.xz`
 3. Update the environment variables in .env file
 4. Run the compose file to deploy otg and labserver services as below.
      `docker-compose -f compose.yaml up -d`
 5. Check if docker containers are running
      `docker ps -a`
 6. Login into otg container and check if gnmi and otg services are started       
      `docker exec -it otg /bin/bash`
 7. Stop the containers.
      `docker-compose -f compose.yaml down`
 
## Environment  
  1. Any Linux OS
  2. Install docker engine and docker compose   
  
## TODO
 1. Upload and get the images from public standard repo's
 2. Aion license server support
 