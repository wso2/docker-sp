# Dockerfiles for WSO2 Stream Processor #

This section defines the step-by-step instructions to build [Ubuntu](https://hub.docker.com/_/ubuntu/) Linux based Docker images for multiple profiles
provided by WSO2 Stream Processor 4.3.0, namely:<br>

1. Dashboard
2. Editor
3. Manager
4. Worker

## Prerequisites

* [Docker](https://www.docker.com/get-docker) v17.09.0 or above

## How to build the WSO2 Stream Processor images and run

##### 1. Checkout this repository into your local machine using the following Git command.

```
git clone https://github.com/wso2/docker-sp.git
```

>The local copy of the `dockerfiles/ubuntu` directory will be referred to as `DOCKERFILE_HOME` from this point onwards.

##### 2. Copy and extract the WSO2 Stream Processor distribution to `<DOCKERFILE_HOME>/base/files`.

- Download [WSO2 Stream Processor 4.3.0 distribution](https://github.com/wso2/product-sp/releases) 
and extract it to `<DOCKERFILE_HOME>/base/files`. <br>
- Download [MySQL Connector/J](https://downloads.mysql.com/archives/c-j) and copy that to `<DOCKERFILE_HOME>/base/files` folder.<br>
- Once all of these are in place, it should look as follows:

  ```bash
  <DOCKERFILE_HOME>/base/files/mysql-connector-java-<version>-bin.jar
  <DOCKERFILE_HOME>/base/files/wso2sp-4.3.0/
  ```
  
>Please refer to [WSO2 Update Manager documentation](https://docs.wso2.com/display/WUM300/WSO2+Update+Manager)
in order to obtain latest bug fixes and updates for the product.

##### 3. Convert and copy the Kafka client jars from the `kafka_2.11-0.10.0.0/libs/` to `<DOCKERFILE_HOME>/base/files` directory

The list of required client jars are;

- kafka_2.11-0.10.2.1.jar
- kafka-clients-0.10.2.1.jar
- metrics-core-2.2.0.jar
- scala-library-2.11.8.jar
- scala-parser-combinators_2.11-1.0.4.jar
- zkclient-0.10.jar
- zookeeper-3.4.9.jar

> Use the `jartobundle.sh` script found it `wso2sp-4.3.0/bin` as shown below; note that you will have to run this command for each jar mentioned above

  ```
  ./wso2sp-4.3.0/bin/jartobundle.sh path/to/kafka/client/jar <DOCKERFILE_HOME>/base/files
  ```

##### 4. Build the base Docker image.

- For base, navigate to `<DOCKERFILE_HOME>/base` directory. <br>
  Execute `docker build` command as shown below.
    + `docker build -t wso2sp-base:4.3.0 .`
        
##### 5. Build Docker images specific to each profile.

- For Dashboard, navigate to `<DOCKERFILE_HOME>/dashboard` directory. <br>
  Execute `docker build` command as shown below. 
    + `docker build -t wso2sp-dashboard:4.3.0 .`
- For Editor, navigate to `<DOCKERFILE_HOME>/editor` directory. <br>
  Execute `docker build` command as shown below. 
    + `docker build -t wso2sp-editor:4.3.0 .`
- For Manager, navigate to `<DOCKERFILE_HOME>/manager` directory. <br>
  Execute `docker build` command as shown below. 
    + `docker build -t wso2sp-manager:4.3.0 .`
- For Worker, navigate to `<DOCKERFILE_HOME>/worker` directory. <br>
  Execute `docker build` command as shown below. 
    + `docker build -t wso2sp-worker:4.3.0 .`
    
##### 6. Running Docker images specific to each profile.

- For Dashboard,
    + `docker run -it -p 9643:9643 wso2sp-dashboard:4.3.0`
- For Editor,
    + `docker run -it -p 9390:9390 -p 9743:9743 wso2sp-editor:4.3.0`
- For Manager,
    + `docker run -it wso2sp-manager:4.3.0`
- For Worker,
    + `docker run -it wso2sp-worker:4.3.0`   

##### 7. Accessing management console per each profile.

- For Dashboard,
    + Business Rules:<br>
    `https://<DOCKER_HOST>:9643/business-rules`
    + Portal:<br>
    `https://<DOCKER_HOST>:9643/portal`
    + Monitoring:<br>
    `https://<DOCKER_HOST>:9643/monitoring`
- For Editor,
    + `http://<DOCKER_HOST>:9390/editor`
    
>In here, <DOCKER_HOST> refers to hostname or IP of the host machine on top of which containers are spawned.

## How to update configurations

Configurations would lie on the Docker host machine and they can be volume mounted to the container. <br>
As an example, steps required to change the port offset using `deployment.yaml` is as follows.

##### 1. Stop the Identity Server Analytics container if it's already running.

In WSO2 Stream Processor 4.3.0 product distribution, `deployment.yaml` configuration file <br>
can be found at `<DISTRIBUTION_HOME>/conf/worker`. Copy the file to some suitable location of the host machine, <br>
referred to as `<SOURCE_CONFIGS>/deployment.yaml` and change the offset value under ports to 2.

##### 2. Grant read permission to `other` users for `<SOURCE_CONFIGS>/deployment.yaml`
```
chmod o+r <SOURCE_CONFIGS>/deployment.yaml
```

##### 3. Run the image by mounting the file to container as follows.
```
docker run 
-p 7713:7713
--volume <SOURCE_CONFIGS>/deployment.yaml:<TARGET_CONFIGS>/deployment.yaml
wso2sp-worker:4.3.0
```

>In here, <TARGET_CONFIGS> refers to /home/wso2carbon/wso2sp-4.3.0/conf/worker folder of the container.

## Docker command usage references

* [Docker build command reference](https://docs.docker.com/engine/reference/commandline/build/)
* [Docker run command reference](https://docs.docker.com/engine/reference/run/)
* [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)