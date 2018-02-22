# WSO2 Stream Processor Distributed setup

Runs a pre configured Stream Processor setup with Kafka broker and Stream Processor manager, worker and dashboard nodes.

## Prerequisites

 * [Docker](https://www.docker.com/get-docker) and [Docker Compose](https://docs.docker.com/compose/install/#install-compose) are required for running this Docker Compose file.

## How to deploy

  1. Build the Kafka, Stream Processor manager, worker and dashboard images using [SP Dockerfiles](../../dockerfiles/README.md)

     > In the `docker-compose.yml`, remove the `dockerhub.wso2.com/` prefix from the `image` name

     > For example, change the line `image: dockerhub.wso2.com/kafka:2.11-0.10.0.0` to `image: kafka:2.11-0.10.0.0`

  2. Pull MySQL Docker image:
     ```
     docker pull mysql:5.7.19
     ```

  3. Download the latest Stream Processor Docker resources release zip file from the [releases](https://github.com/wso2/docker-sp/releases) page or clone this repository to your local machine and switch to the latest tag.
  
     > Note that the local copy of `docker-sp` repository will be referred to as `[docker-sp]` from this point onwards.

  4. Switch to the docker-compose/manager-worker-dashboard folder:
     ```
     cd [docker-sp]/docker-compose/manager-worker-dashboard
     ```

  5. Execute the following Docker Compose command to start the deployment:
     ```
     docker-compose up
     ```

  6. In order to publish events from the Docker host machine, configure the Kafka container's id in the /etc/hosts file. This can be done as follows;
     - Get the `container_id` of the Kafka container using `docker ps` command, name of the Kafka container is `wso2sp-kafka`
     - Use the `container_id` obtained above to find the IP address of the container using, `docker inspect <container_id>` command
     - Add a host entry for the `container_id` with the IP address obtained above

     > The host entry should be as follows;

     ```
     <container_ip> <container_id>
     ```

  7. In the Siddhi apps, set the hostname of the `bootstrap.server` as `kafka` as shown below;
     ```
     bootstrap.servers='kafka:9092',
     ```

  8. Add the following host entry for Stream Processor dashboard component;
      ```
      127.0.0.1 wso2sp-dashboard
      ```
      > The Stream Processor dashboard can be accessed using the following URL
      ```
      https://wso2sp-dashboard:9643/monitoring/
      ```