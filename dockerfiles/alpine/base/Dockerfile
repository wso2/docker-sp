
# ------------------------------------------------------------------------
#
# Copyright 2018 WSO2, Inc. (http://wso2.com)
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

# set base Docker image to AdoptOpenJDK Alpine Docker image
FROM adoptopenjdk/openjdk8:alpine
MAINTAINER WSO2 Docker Maintainers "dev@wso2.org”

# set user configurations
ARG USER=wso2carbon
ARG USER_ID=802
ARG USER_GROUP=wso2
ARG USER_GROUP_ID=802
ARG USER_HOME=/home/${USER}
# set dependant files directory
ARG FILES=./files
# set wso2 product configurations
ARG WSO2_SERVER=wso2sp
ARG WSO2_SERVER_VERSION=4.3.0
ARG WSO2_SERVER_PACK=${WSO2_SERVER}-${WSO2_SERVER_VERSION}
ARG WSO2_SERVER_HOME=${USER_HOME}/${WSO2_SERVER_PACK}
ENV ENV=${USER_HOME}"/.ashrc"

# install required packages
RUN  apk add --update --no-cache \
     curl \
     netcat-openbsd && \
     rm -rf /var/cache/apk/*

# create a user group and a user
RUN  addgroup -g ${USER_GROUP_ID} ${USER_GROUP}; \
     adduser -u ${USER_ID} -D -g '' -h ${USER_HOME} -G ${USER_GROUP} ${USER} ;

# MOTD login message
RUN echo 'printf "Welcome to WSO2 Docker resources.\n\
----------------------------------\n\
The Docker container contains the WSO2 product with its latest updates,\n\
which are under the End User License Agreement (EULA) 2.0.\n\
Read more about EULA 2.0 (https://wso2.com/licenses/wso2-update/2.0).\n"' > "$ENV"

# copy the wso2 product distribution to user's home directory
COPY --chown=wso2carbon:wso2 ${FILES}/${WSO2_SERVER_PACK}/ ${WSO2_SERVER_HOME}/
# copy the Kafka client jars to the product home
COPY --chown=wso2carbon:wso2 ${FILES}/kafka_2.11_0.10.0.0_1.0.0.jar ${USER_HOME}/${WSO2_SERVER_PACK}/lib/
COPY --chown=wso2carbon:wso2 ${FILES}/kafka_clients_0.10.0.0_1.0.0.jar ${USER_HOME}/${WSO2_SERVER_PACK}/lib/
COPY --chown=wso2carbon:wso2 ${FILES}/metrics_core_2.2.0_1.0.0.jar ${USER_HOME}/${WSO2_SERVER_PACK}/lib/
COPY --chown=wso2carbon:wso2 ${FILES}/scala_library_2.11.8_1.0.0.jar ${USER_HOME}/${WSO2_SERVER_PACK}/lib/
COPY --chown=wso2carbon:wso2 ${FILES}/scala_parser_combinators_2.11_1.0.4_1.0.0.jar ${USER_HOME}/${WSO2_SERVER_PACK}/lib/
COPY --chown=wso2carbon:wso2 ${FILES}/zkclient_0.8_1.0.0.jar ${USER_HOME}/${WSO2_SERVER_PACK}/lib/
COPY --chown=wso2carbon:wso2 ${FILES}/zookeeper_3.4.6_1.0.0.jar ${USER_HOME}/${WSO2_SERVER_PACK}/lib/
COPY --chown=wso2carbon:wso2 ${FILES}/mysql-connector-java-5.1.45-bin.jar ${USER_HOME}/${WSO2_SERVER_PACK}/lib/

# set environment variables
ENV WSO2_SERVER_HOME=${WSO2_SERVER_HOME} \
    WORKING_DIRECTORY=${USER_HOME}

# set the user and work directory
USER ${USER_ID}
WORKDIR ${USER_HOME}
