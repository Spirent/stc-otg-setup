## STC-OTG-SETUP

This document describes deploying STC Labserver and OTG services using a docker-compose yaml file and its required the below files.

  - **otg-compose.yaml**: Main docker compose yaml file 
  - **.env**: environment variables defined for docker compose file.
  - **Dockerfile**: Dockerfile to build otg services
  - **entrypoint.sh**: shell script used to start otg services(gnmi and otg) 
 
## Deployment steps
 1. Clone the repository
      `git clone https://github.com/SpirentOrion/stc-otg-setup`
 2. Download and keep the otg binary file(otgservice.V1.0.40.20240805081514.sh) in stc-otg-setup folder
 3. Download and extract labserver container image locally if required any particular labserver version(labserver-5.51.2946.tar.xz)
      `docker load -i labserver-5.51.2946.tar.xz`
 4. Update the environment variables and otgservice binary file in .env file
 5. Run the compose file to deploy otg and labserver services as below.
      `docker-compose -f otg-compose.yaml up -d`
 6. Check if docker containers are running
      `docker ps -a`
 7. Login into otg container and check if gnmi and otg services are started       
      `docker exec -it otg /bin/bash`
 8. Stop the containers.
      `docker-compose -f otg-compose.yaml down`
 
## Environment  
  - Install docker engine and docker compose on any flavour of Linux VM.
      **Docker version**: 24.0.5
      **Docker-compose version**: 1.29.2  
  
## TODO
 1. Upload and get the images from public standard repo's
 2. Aion license server support
 
