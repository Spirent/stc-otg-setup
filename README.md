## STC-OTG-SETUP

This document describes deploying STC Labserver and OTG services using a docker-compose yaml file and its required the below files.

  - **otg-compose.yaml**: Main docker compose yaml file
  - **.env**: environment variables defined for docker compose file.
  - **Dockerfile**: Dockerfile to build otg services
  - **entrypoint.sh**: shell script used to start otg services(gnmi and otg)

## Deployment steps
 1. Clone the repository
      `git clone https://github.com/SpirentOrion/stc-otg-setup`
 2. Download and keep the otg binary file(otgservice.V1.0.42.20240805081514.sh) in stc-otg-setup folder
 3. Download and extract labserver container image locally if required any particular labserver version(labserver-5.51.2946.tar.xz)
      `docker load -i labserver-5.49.2816.tar.xz`
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

## AION Licensing
  - **Create or update AION user:**<br>
    `curl -X PUT http://${OTGSERVICE_TARGET}/user -H "Content-Type: application/json" -d '{"username":"","server":"","password":"","workspace":"" }'`

    For example:<br>
    `curl -X PUT http://localhost:50051/user -H "Content-Type: application/json" -d '{"username":"demo@spirent.com","server":"http://10.61.37.138/","password":"","workspace":"Spirent"}'`
  - **Get aion user:**<br>
    `curl -X GET http://${OTGSERVICE_TARGET}/user`
  - **Remove aion user:**<br>
    `curl -X POST http://${OTGSERVICE_TARGET}/user/remove`
  - **Test aion user connection:**<br>
     `curl -X POST http://${OTGSERVICE_TARGET}/user/test`

## ToDo
    1.Replace Ubuntu to a more light OS like alpine
    2.Review for technical,security and document before migrate to Spirent repo
    3.KNE deployment solution
