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

# set to latest Alpine
FROM openjdk:8u171-jdk-alpine3.8
MAINTAINER WSO2 Docker Maintainers "dev@wso2.org”

# set user configurations
ARG USER=wso2carbon
ARG USER_ID=802
ARG USER_GROUP=wso2
ARG USER_GROUP_ID=802
ARG USER_HOME=/home/${USER}
# set dependant files directory
ARG FILES=./files
# set product configurations
ARG DISTRO_NAME=kafka_2.11-0.10.0.0
ARG KAFKA_HOME=${USER_HOME}/${DISTRO_NAME}

RUN apk add --update --no-cache \
    netcat-openbsd && \
    rm -rf /var/cache/apk/*

RUN addgroup -S ${USER_GROUP} ; \
    adduser -D -S -G ${USER_GROUP} ${USER} ;

# copy the required files
COPY --chown=wso2carbon:wso2 docker-entrypoint.sh ${USER_HOME}
COPY --chown=wso2carbon:wso2 ${FILES}/${JDK} ${USER_HOME}/java
COPY --chown=wso2carbon:wso2 ${FILES}/${DISTRO_NAME} ${USER_HOME}/${DISTRO_NAME}

# create Java prefs dir
# this is to avoid warning logs printed by FileSystemPreferences class
RUN mkdir -p ${USER_HOME}/.java/.systemPrefs && \
    mkdir -p ${USER_HOME}/.java/.userPrefs  && \
    chmod -R 755 ${USER_HOME}/.java && \
    chown -R ${USER}:${USER_GROUP} ${USER_HOME}/.java

# set environment variables
ENV WSO2_SERVER_HOME=${WSO2_SERVER_HOME} \
    JAVA_OPTS="-Djava.util.prefs.systemRoot=${USER_HOME}/.java -Djava.util.prefs.userRoot=${USER_HOME}/.java/.userPrefs"

# set environment variables
#ENV JAVA_HOME=${JAVA_HOME} \
#    PATH=$JAVA_HOME/bin:$PATH

USER ${USER}
WORKDIR ${USER_HOME}

ENTRYPOINT ./docker-entrypoint.sh
