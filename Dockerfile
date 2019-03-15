FROM jenkins/jenkins:lts

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

USER root

# Install AWS-CLI
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

# Install node 8.XX
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get update \
    && apt-get install -y \
        nodejs \
        gcc \
        g++ \
        make \
    && apt-get clean \
    && nodejs -v \
    && npm install npm@latest -g

# Install zip
RUN apt-get update \
    && apt-get install -y zip \
    && apt-get clean

USER jenkins
