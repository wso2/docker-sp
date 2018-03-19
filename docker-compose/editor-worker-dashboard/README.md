# WSO2 Stream Processor Distributed setup

Runs a pre configured Stream Processor setup with Stream Processor editor, worker and dashboard nodes.

## Prerequisites

 * [Docker](https://www.docker.com/get-docker) and [Docker Compose](https://docs.docker.com/compose/install/#install-compose) are required for running this Docker Compose file.

## How to deploy

  1. In order to run the Docker Compose configuration, you will need an active subscription from WSO2 since the 
     Docker images hosted at docker.wso2.com contains the latest updates and fixes to WSO2 Stream Processor. You can 
     sign up for a Free Trial Subscription [here](https://wso2.com/free-trial-subscription).
     
     > If you wish to run the Docker Compose configuration using Docker images built locally, build the Stream Processor editor, worker and 
     dashboard images using [SP Dockerfiles](../../dockerfiles/README.md) and remove the `docker.wso2.com/` prefix from the `image` name In the `docker-compose.yml` 
 
     > For example, change the line `image: docker.wso2.com/wso2sp-manager:4.0.0` to `image: wso2sp-manager:4.0.0`

  2. Pull MySQL Docker image:
     ```
     docker pull mysql:5.7.19
     ```

  3. Download the latest Stream Processor Docker resources release zip file from the [releases](https://github.com/wso2/docker-sp/releases) page or clone this repository to your local machine and switch to the latest tag.
  
     > Note that the local copy of `docker-sp` repository will be referred to as `[docker-sp]` from this point onwards.

  4. Switch to the docker-compose/editor-worker-dashboard folder:
     ```
     cd [docker-sp]/docker-compose/editor-worker-dashboard
     ```

  5. Execute the following Docker Compose command to start the deployment:
     ```
     docker-compose up
     ```

  6. Add the following host entry for Stream Processor dashboard component;
      ```
      127.0.0.1 wso2sp-dashboard
      ```
      > The Stream Processor dashboard can be accessed using the following URL
      ```
      https://wso2sp-dashboard:9643/monitoring/
      ```
