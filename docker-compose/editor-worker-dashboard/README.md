# WSO2 Stream Processor Distributed setup

Runs a pre configured WSO2 Stream Processor setup of Stream Processor editor, worker and dashboard nodes.

## Prerequisites

 * Install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git), [Docker](https://www.docker.com/get-docker) and [Docker Compose](https://docs.docker.com/compose/install/#install-compose)
   in order to run the steps provided in following Quick start guide. <br><br>
 * In order to use Docker images with WSO2 updates, you need an active WSO2 subscription. If you do not possess an active WSO2
   subscription, you can sign up for a WSO2 Free Trial Subscription from [here](https://wso2.com/free-trial-subscription).
   Otherwise, you can proceed with Docker images which are created using GA releases.<br><br>
 * If you wish to run the Docker Compose configuration using Docker images built locally, build the Stream Processor editor, worker and 
   dashboard images using [SP Dockerfiles](../../dockerfiles) and remove the `docker.wso2.com/` prefix 
   from the `image` name in the `docker-compose.yml`. For example, change the line `image: docker.wso2.com/wso2sp-manager:4.4.0` <br> to `image: wso2sp-manager:4.4.0`. <br><br>

## How to deploy

  1. Clone WSO2 Stream Processor Docker git repository.
     ```
      git clone https://github.com/wso2/docker-sp
     ```
     > If you are to try out an already released zip of this repo, please ignore this 1st step.

  2. Switch to the `docker-compose/editor-worker-dashboard` folder.
     ```
     cd [docker-sp]/docker-compose/editor-worker-dashboard
     ```
     > If you are to try out an already released zip of this repo, please ignore this 2nd step also. 
      Instead, extract the zip file and directly browse to `docker-sp-<released-version-here>/docker-compose/editor-worker-dashboard` folder. 
     
     > If you want to try out an already released tag, after executing 2nd step, checkout the relevant tag, 
      i.e. for example: git checkout tags/v4.4.0.1 and continue below steps.

  3. [Optional] If you are using WSO2 product Docker images with WSO2 updates, replace the WSO2 product Docker image names
    (relevant `image` attribute under each WSO2 product profile service) in the Docker Compose deployment definition.
    
   **Note**: By default, each product profile service is configured to use WSO2 product Docker images with GA releases.

  4. Execute the following Docker Compose command to start the deployment.
     ```
     docker-compose up
     ```

  5. Access management console via a web browser.
     ```
     For Status dashboard - https://localhost:9643/monitoring
     For Editor - http://localhost:9390/editor
     ```
