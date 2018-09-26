# Dockerfiles for WSO2 Stream Processor #

This section defines Dockerfiles and step-by-step instructions to build Docker images for product profiles provided by
WSO2 Stream Processor 4.3.0, namely : <br>
1. Dashboard
2. Editor
3. Manager
4. Worker
5. Kafka

## How to build the WSO2 Stream Processor images and run

##### 1. Checkout this repository into your local machine using the following Git command.
```
git clone https://github.com/wso2/docker-sp.git
```

>The local copy of the `dockerfiles` directory will be referred to as `DOCKERFILE_HOME` from this point onwards.

##### 2. Copy the extract JDK and WSO2 Stream Processor distributions to `<DOCKERFILE_HOME>/base/files`
- Download [JDK 1.8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) 
and extract it to `<DOCKERFILE_HOME>/base/files`.
- Download [WSO2 Stream Processor 4.3.0 distribution](https://github.com/wso2/product-sp/releases) 
and extract it to `<DOCKERFILE_HOME>/base/files`. <br>

##### 3. Download [MySQL Connector/J](https://dev.mysql.com/downloads/connector/j/) v5.1.45 and copy the jar to `<DOCKERFILE_HOME>/base/files`
   ```
   cp path/to/mysql/connector/jar <DOCKERFILE_HOME>/base/files
   ```

##### 4. Convert and copy the Kafka client jars from the `kafka_2.11-0.10.0.0/libs/` to `<DOCKERFILE_HOME>/base/files` directory

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
    + `docker build -t wso2sp-base:4.3.0-alpine .`
        
##### 5. Build Docker images specific to each profile.
- For Dashboard, navigate to `<DOCKERFILE_HOME>/dashboard` directory. <br>
  Execute `docker build` command as shown below. 
    + `docker build -t wso2sp-dashboard:4.3.0-alpine .`
- For Editor, navigate to `<DOCKERFILE_HOME>/editor` directory. <br>
  Execute `docker build` command as shown below. 
    + `docker build -t wso2sp-editor:4.3.0-alpine .`
- For Manager, navigate to `<DOCKERFILE_HOME>/manager` directory. <br>
  Execute `docker build` command as shown below. 
    + `docker build -t wso2sp-manager:4.3.0-alpine .`
- For Worker, navigate to `<DOCKERFILE_HOME>/worker` directory. <br>
  Execute `docker build` command as shown below. 
    + `docker build -t wso2sp-worker:4.3.0-alpine .`
    
##### 6. Running Docker images specific to each profile.
- For Dashboard,
    + `docker run -it -p 9643:9643 wso2sp-dashboard:4.3.0-alpine`
- For Editor,
    + `docker run -it -p 9390:9390 -p 9743:9743 wso2sp-editor:4.3.0-alpine`
- For Manager,
    + `docker run -it wso2sp-manager:4.3.0-alpine`
- For Worker,
    + `docker run -it wso2sp-worker:4.3.0-alpine`   

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

## How to build the Kafka docker image

> In order to run a distributed Stream Processor setup, Kafka is required. This section provide the steps to build the
Kafka docker image.

##### 1. Copy the extract JDK and Kafka distributions to `<DOCKERFILE_HOME>/kafka/files`.
- Download [JDK 1.8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
and extract it to `<DOCKERFILE_HOME>/kafka/files`.
- Download [Kafka 2.11-0.10.0.0](https://kafka.apache.org/downloads) and extract it to
`<DOCKERFILE_HOME>/kafka/files`.

##### 2. Build the base Docker image.
- Navigate to `<DOCKERFILE_HOME>/kafka` directory.
  Execute `docker build` command as shown below.
    + `docker build -t kafka:2.11-0.10.0.0 .`

## Docker command usage references

* [Docker build command reference](https://docs.docker.com/engine/reference/commandline/build/)
* [Docker run command reference](https://docs.docker.com/engine/reference/run/)
* [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)