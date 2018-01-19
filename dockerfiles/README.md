# Dockerfiles for WSO2 Stream Processor #

This section defines Dockerfiles and step-by-step instructions to build Docker images for product profiles provided by
WSO2 Stream Processor 4.0.0, namely : <br>
1. Dashboard
2. Editor
3. Manager
4. Worker

## How to build an image and run
##### 1. Checkout this repository into your local machine using the following Git command.
```
git clone https://github.com/wso2/docker-sp.git
```

>The local copy of the `dockerfiles` directory will be referred to as `DOCKERFILE_HOME` from this point onwards.

##### 2. Add JDK and WSO2 Stream Processor distributions to `<DOCKERFILE_HOME>/base/files`
- Download [JDK 1.8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) 
and copy that to `<DOCKERFILE_HOME>/base/files`.
- Download [WSO2 Stream Processor 4.0.0 distribution](https://github.com/wso2/product-sp/releases) 
and copy that to `<DOCKERFILE_HOME>/base/files`. <br>

##### 3. Build the base Docker image.
- For base, navigate to `<DOCKERFILE_HOME>/base` directory. <br>
  Execute `docker build` command as shown below.
    + `docker build -t wso2sp-base:4.0.0 .`
        
##### 4. Build Docker images specific to each profile.
- For Dashboard, navigate to `<DOCKERFILE_HOME>/dashboard` directory. <br>
  Execute `docker build` command as shown below. 
    + `docker build -t wso2sp-dashboard:4.0.0 .`
- For Editor, navigate to `<DOCKERFILE_HOME>/editor` directory. <br>
  Execute `docker build` command as shown below. 
    + `docker build -t wso2sp-editor:4.0.0 .`
- For Manager, navigate to `<DOCKERFILE_HOME>/manager` directory. <br>
  Execute `docker build` command as shown below. 
    + `docker build -t wso2sp-manager:4.0.0 .`
- For Worker, navigate to `<DOCKERFILE_HOME>/worker` directory. <br>
  Execute `docker build` command as shown below. 
    + `docker build -t wso2sp-worker:4.0.0 .`
    
##### 5. Running Docker images specific to each profile.
- For Dashboard,
    + `docker run -it -p 9643:9643 wso2sp-dashboard:4.0.0`
- For Editor,
    + `docker run -it -p 9390:9390 -p 9743:9743 wso2sp-editor:4.0.0`
- For Manager,
    + `docker run -it wso2sp-manager:4.0.0`
- For Worker,
    + `docker run -it wso2sp-worker:4.0.0`   

##### 6. Accessing management console per each profile.
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

## Docker command usage references

* [Docker build command reference](https://docs.docker.com/engine/reference/commandline/build/)
* [Docker run command reference](https://docs.docker.com/engine/reference/run/)
* [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)