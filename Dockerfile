FROM jenkins/jenkins:lts

USER root

RUN apt-get update \
    && apt-get install -y \
        python3 \
        python3-pip \
        python3-setuptools \
        groff \
        less \
    && pip3 install --upgrade pip \
    && apt-get clean

RUN pip3 --no-cache-dir install --upgrade awscli

#Install node 8.XX
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs \
    && apt-get clean \
    && nodejs -v \
    && npm install npm@latest -g

USER jenkins
