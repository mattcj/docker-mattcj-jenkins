FROM jenkins:1.642.1

USER root
RUN apt-get update; apt-get install -y git locales
RUN sed -i '/# en_US.UTF-8 UTF-8/s/# //' /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
USER jenkins
