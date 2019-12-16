FROM ubuntu:trusty

MAINTAINER Linhai Zhao (Linhai.Zhao@bcm.edu)

# Both RV-NPL and RarePedSim run python 2.7
# Install miniconda2 and dependencies: https://hub.docker.com/r/conda/miniconda2/dockerfile
RUN apt-get -qq update && apt-get -qq -y install software-properties-common \
    && add-apt-repository ppa:ubuntu-toolchain-r/test \
    && apt-get -qq update && apt-get -qq -y install wget bzip2 swig gcc-5 g++-5 libboost1.55-all-dev \
    && wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /opt/miniconda2 \
    && rm -rf /tmp/miniconda.sh /var/lib/apt/lists/* /var/log/dpkg.log

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 1 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 1

ENV PATH=/opt/miniconda2/bin:${PATH}
RUN conda install -y matplotlib scipy \
    && conda update conda \
    && conda clean --all --yes

RUN conda install -c bioconda tabix \
    && conda clean --all --yes

# RarePedSim
RUN cd /tmp && wget http://bioinformatics.org/simped/rare/download/rarepedsim-1.0.1rc-linux-x86_64.bundle && bash rarepedsim-1.0.1rc-linux-x86_64.bundle /usr/local && rm -rf /tmp/*

# RV-NPL
RUN cd /tmp && wget https://github.com/statgenetics/rvnpl/archive/master.tar.gz && tar xzvf master.tar.gz && cd rvnpl-master && python setup.py install && rm -rf /tmp/*

ENV PYTHON_EGG_CACHE=/tmp/Python-Eggs

# Default command
CMD ["bash"]
