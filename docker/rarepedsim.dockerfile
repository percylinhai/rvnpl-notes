FROM debian:stable-slim

MAINTAINER Linhai Zhao (Linhai.Zhao@bcm.edu)

RUN apt-get -qq update && apt-get -qq -y install tabix wget bzip2 xz-utils \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log

# RarePedSim
RUN cd /tmp && wget http://bioinformatics.org/simped/rare/download/rarepedsim-1.0.1rc-linux-x86_64.bundle && bash rarepedsim-1.0.1rc-linux-x86_64.bundle /usr/local && rm -rf /tmp/*

# Default command
CMD ["bash"]
