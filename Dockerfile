FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Installing gnupg2
RUN apt-get update && apt-get install -y gnupg2 apt-transport-https ca-certificates gnupg-agent lsb-release software-properties-common systemd

# Installing wget, curl
RUN apt-get update && apt-get install -y wget curl && rm -rf /var/lib/apt/lists/*

# Add Docker’s official GPG key
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Set up the stable repository
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install the latest version of Docker Engine - Community and containerd
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

#RUN systemctl daemon-reload
RUN service docker restart
RUN service docker status

# Verify that Docker Engine - Community is installed correctly
RUN docker run hello-world

# Installing Node
#RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
#RUN sh -c "echo deb https://deb.nodesource.com/node_10.x bionic main > /etc/apt/sources.list.d/nodesource.list"
#RUN apt-get update && apt-get install -y nodejs

# Installing chrome
#RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#RUN apt-get update && apt-get install -yq google-chrome-stable

# Installing firefox
#RUN apt-get update && apt-get install -y software-properties-common
#RUN add-apt-repository -y ppa:mozillateam/firefox-next
#RUN apt-get update && apt-get install -y firefox && rm -rf /var/lib/apt/lists/*
