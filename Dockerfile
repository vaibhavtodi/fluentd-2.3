# Specifing the base image
FROM            ubuntu:14.04.3

# Maintainer
MAINTAINER      "Vaibhav Todi"  <vaibhavtodi1989@gmail.com>

# Specifing the Label
LABEL           Description="A Fluentd-2.3 Docker image where base image is Ubuntu 14.04.3"                                 \
                Version="1.0"

# Setting the Environment & Working Directory
ENV             home            /root
WORKDIR         $home
USER            root

# Updating the base system & installing the packages
RUN             apt-get         update                                                                                      \
      &&        apt-get         install  -y   apt-transport-https software-properties-common vim curl

# Importing, Downloading & Insatalling Fluentd
RUN             curl      -L    https://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh                \
      &&        apt-get         update

# Copy entrypoint.sh script
COPY            entrypoint.sh   /entrypoint.sh

# Cleaning the Docker Image
RUN             apt-get   -y    clean                                                                                       \
      &&        rm        -rf   /var/lib/apt/lists/*                                                                        \
      &&        rm        -rf   /var/cache/*

# Mounting the Volume
VOLUME          ["/etc/td-agent", "/var/log/td-agent"]

# Exposing the port
EXPOSE          24224           9292

# CMD Insstruction
CMD             ["/entrypoint.sh"]
