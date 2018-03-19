# WSO2 Stream Processor Distributed setup

Runs a pre configured Stream Processor setup with Stream Processor editor, worker and dashboard nodes.

## Prerequisites

 * [Docker](https://www.docker.com/get-docker) and [Docker Compose](https://docs.docker.com/compose/install/#install-compose) are required for running this Docker Compose file.
 * In order to run the Docker Compose configuration, you will need an active subscription from WSO2 since the 
   Docker images hosted at docker.wso2.com contains the latest updates and fixes to WSO2 Stream Processor. You can 
   sign up for a Free Trial Subscription [here](https://wso2.com/free-trial-subscription).
 * If you wish to run the Docker Compose configuration using Docker images built locally, build the Stream Processor editor, worker and 
   dashboard images using [SP Dockerfiles](../../dockerfiles/README.md) and remove the `docker.wso2.com/` prefix 
   from the `image` name In the `docker-compose.yml`. For example, change the line `image: docker.wso2.com/wso2sp-manager:4.0.0` to `image: wso2sp-manager:4.0.0`

## How to deploy

  1. Clone WSO2 Stream Processor Docker git repository.
     ```
      git clone https://github.com/wso2/docker-sp
     ```
     > Note that the local copy of `docker-sp` repository will be referred to as `[docker-sp]` from this point onwards.

  2. Switch to the docker-compose/editor-worker-dashboard folder:
     ```
     cd [docker-sp]/docker-compose/editor-worker-dashboard
     ```

  3. Execute the following Docker Compose command to start the deployment:
     ```
     docker-compose up
     ```

  4. Add the following host entry for Stream Processor dashboard component;
      ```
      127.0.0.1 wso2sp-dashboard
      ```
      > The Stream Processor dashboard can be accessed using the following URL
      ```
      https://wso2sp-dashboard:9643/monitoring/
      ```
