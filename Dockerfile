FROM jenkins:latest

USER root
RUN apt-get update; apt-get install -y git locales
RUN sed -i '/# en_US.UTF-8 UTF-8/s/# //' /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install Google-Cloud-SDK
RUN cd /usr/local && curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-132.0.0-linux-x86.tar.gz | tar xz
RUN /usr/local/google-cloud-sdk/install.sh -q

# switch user back to jenkins for subsequent container operations
USER jenkins
# Include gcloud in path
ENV PATH /usr/local/google-cloud-sdk/bin:$PATH
RUN gcloud components update -q
