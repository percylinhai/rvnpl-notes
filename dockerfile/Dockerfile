FROM gaow/base-notebook:1.0.0

MAINTAINER Diana Cornejo <dmc2245@cumc.columbia.edu>

USER root
# Both RV-NPL and RarePedSim run python 2.7
RUN conda create --name py2 python=2.7
 
# RarePedSim
RUN wget http://bioinformatics.org/simped/rare/download/rarepedsim-1.0.1rc-linux-x86_64.bundle
RUN bash ./rarepedsim-1.0.1rc-linux-x86_64.bundle /usr/local

# Download boost_python
RUN wget -O boost_1_55_0.tar.gz https://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.gz/download
RUN tar xzvf boost_1_55_0.tar.gz

# Download RV-NPL
RUN wget https://github.com/statgenetics/rvnpl/archive/master.zip
RUN unzip master.zip

# Install swig
RUN bash -c "source activate py2 && add-apt-repository ppa:ubuntu-toolchain-r/test && apt-get update && apt-get install -y swig"

# Install gcc5
RUN bash -c "source activate py2 && add-apt-repository ppa:ubuntu-toolchain-r/test && apt-get update && apt-get install gcc-5 g++-5 -y && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 1 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 1"
RUN g++ -v


# Install boost_python
RUN bash -c "source activate py2 && cd boost_1_55_0/ && ./bootstrap.sh --prefix=/usr/local && ./b2 install"; exit 0

# RV-NPL
RUN bash -c "source activate py2 && conda install -c conda-forge matplotlib && conda install -c anaconda scipy"
RUN bash -c "source activate py2 && cd rvnpl-master && python setup.py install --prefix=/usr/local --install-platlib=/opt/conda/envs/py2/lib/python2.7/site-packages --install-scripts=/usr/local/bin"

# test
ENV LD_LIBRARY_PATH=/usr/local/lib/:${LD_LIBRARY_PATH}
RUN rarepedsim -h
RUN rvnpl -h
