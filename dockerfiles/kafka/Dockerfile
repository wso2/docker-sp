FROM ubuntu:16.04

# set user configurations
ARG USER=kafka
ARG USER_GROUP=kafka
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

RUN groupadd --system ${USER_GROUP} && \
    useradd --system --create-home --home-dir ${USER_HOME} --no-log-init -g ${USER_GROUP} ${USER}

COPY --chown=kafka:kafka docker-entrypoint.sh ${USER_HOME}
COPY --chown=kafka:kafka ${FILES}/${JDK} ${USER_HOME}/java
COPY --chown=kafka:kafka ${FILES}/${DISTRO_NAME} ${USER_HOME}/${DISTRO_NAME}

# set environment variables
ENV JAVA_HOME=${JAVA_HOME} \
    PATH=$JAVA_HOME/bin:$PATH

USER ${USER}
WORKDIR ${USER_HOME}

ENTRYPOINT ./docker-entrypoint.sh





