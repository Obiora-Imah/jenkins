FROM jenkins/jenkins

USER root
RUN apt-get update && \
    apt-get install -y python python-pip python3-pip && \
    pip3 install ansible --upgrade

USER jenkins


