FROM ubuntu:trusty

MAINTAINER Linhai Zhao (Linhai.Zhao@bcm.edu)

# Both RV-NPL and RarePedSim run python 2.7
# Install miniconda2 and dependencies: https://hub.docker.com/r/conda/miniconda2/dockerfile
RUN apt-get -qq update && apt-get -qq -y install software-properties-common \
    && add-apt-repository ppa:ubuntu-toolchain-r/test\
    && apt-get -qq update && apt-get -qq -y install wget bzip2 swig gcc-5 g++-5 libboost1.55-all-dev \
    && wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=2 matplotlib scipy \
    && conda update conda \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 1 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 1

# Download and install boost
# RUN cd /tmp && wget -O boost_1_55_0.tar.gz https://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.gz/download && tar xzvf boost_1_55_0.tar.gz && cd boost_1_55_0/ && ./bootstrap.sh --prefix=/usr/local && ./b2 install && rm -rf /tmp/*

# RarePedSim
RUN cd /tmp && wget http://bioinformatics.org/simped/rare/download/rarepedsim-1.0.1rc-linux-x86_64.bundle && bash rarepedsim-1.0.1rc-linux-x86_64.bundle /usr/local && rm -rf /tmp/*

# RV-NPL
RUN cd /tmp && wget https://github.com/statgenetics/rvnpl/archive/master.tar.gz && tar xzvf master.tar.gz && cd rvnpl-master && python setup.py install --prefix=/usr/local --install-platlib=/opt/conda/envs/py2/lib/python2.7/site-packages --install-scripts=/usr/local/bin && rm -rf /tmp/*

ENV LD_LIBRARY_PATH=/usr/local/lib/:${LD_LIBRARY_PATH}

# Default command
CMD ["bash"]
