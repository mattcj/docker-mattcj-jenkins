FROM jenkins:1.609

USER root
RUN apt-get update; apt-get install -y git
USER jenkins
