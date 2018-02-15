# ------------------------------------------------------------------------
#
# Copyright 2017 WSO2, Inc. (http://wso2.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License
#
# ------------------------------------------------------------------------

# set to latest Ubuntu LTS
FROM ubuntu:16.04
MAINTAINER WSO2 Docker Maintainers "dev@wso2.org"

# set user configurations
ARG USER=wso2carbon
ARG USER_ID=802
ARG USER_GROUP=wso2
ARG USER_GROUP_ID=802
ARG USER_HOME=/home/${USER}
ARG FILES=./files

# set jdk configurations
ARG JDK=jdk1.8.0*
ARG JAVA_HOME=${USER_HOME}/java

# set product configurations
ARG DISTRO_NAME=kafka_2.11-0.10.0.0
ARG KAFKA_HOME=${USER_HOME}/${DISTRO_NAME}

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends --no-install-suggests \
    netcat && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd --system -g ${USER_GROUP_ID} ${USER_GROUP} && \
    useradd --system --create-home --home-dir ${USER_HOME} --no-log-init -g ${USER_GROUP_ID} -u ${USER_ID} ${USER}

# copy the required files
COPY --chown=wso2carbon:wso2 docker-entrypoint.sh ${USER_HOME}
COPY --chown=wso2carbon:wso2 ${FILES}/${JDK} ${USER_HOME}/java
COPY --chown=wso2carbon:wso2 ${FILES}/${DISTRO_NAME} ${USER_HOME}/${DISTRO_NAME}

# set environment variables
ENV JAVA_HOME=${JAVA_HOME} \
    PATH=$JAVA_HOME/bin:$PATH

USER ${USER}
WORKDIR ${USER_HOME}

ENTRYPOINT ./docker-entrypoint.sh
