# WSO2 Stream Processor Distributed setup

Runs a pre configured Stream Processor setup with Stream Processor editor, worker and dashboard nodes.

## Prerequisites

 * Install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git), [Docker](https://www.docker.com/get-docker) and [Docker Compose](https://docs.docker.com/compose/install/#install-compose)
   in order to run the steps provided in following Quick start guide. <br><br>
  * In order to run this Docker Compose setup, you will need an active [Free Trial Subscription](https://wso2.com/free-trial-subscription) 
   from WSO2 since the referring Docker images hosted at docker.wso2.com contains the latest updates and fixes for WSO2 Stream Processor. You can sign up for a Free Trial Subscription [here](https://wso2.com/free-trial-subscription). <br><br>
 * If you wish to run the Docker Compose configuration using Docker images built locally, build the Stream Processor editor, worker and 
   dashboard images using [SP Dockerfiles](../../dockerfiles/README.md) and remove the `docker.wso2.com/` prefix 
   from the `image` name In the `docker-compose.yml`. For example, change the line `image: docker.wso2.com/wso2sp-manager:4.1.0` <br> to `image: wso2sp-manager:4.1.0`. <br><br>

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
      Instead, extract the zip file and directly browse to `docker-sp-<released-version-here>docker-compose/editor-worker-dashboard` folder. 
     
     > If you want to try out an already released tag, after executing 2nd step, checkout the relevant tag, 
      i.e. for example: git checkout tags/v4.1.0.2 and continue below steps.

  3. Execute the following Docker Compose command to start the deployment.
     ```
     docker-compose up
     ```

  4. Access management console via a web browser.
     ```
     For Status dashboard - https://localhost:9390/monitoring
     For Editor - https://localhost:9743/editor
     ```

