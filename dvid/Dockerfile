FROM ubuntu:12.04
MAINTAINER Stephen Plaza <plazas@janelia.hhmi.org>

# set environment variables
ENV GOROOT /usr/local/go
ENV GOPATH=$HOME/go
ENV DVIDSRC=$GOPATH/src/github.com/janelia-flyem/dvid
ENV BUILDEM_DIR $HOME/buildem
ENV LD_LIBRARY_PATH $BUILDEM_DIR/lib:$LD_LIBRARY_PATH
ENV PATH /usr/local/go/bin:$BUILDEM_DIR/bin:$PATH
ENV DVIDDATA /var/dvid
ENV CONSOLEVERSION 1.3.1

# install basic dependencies
RUN apt-get -y update && apt-get install -y \
    git \
    make \ 
    g++ \
    cmake \
    wget \
    mercurial \
    zip

# install go binary
RUN wget https://storage.googleapis.com/golang/go1.5.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.5.linux-amd64.tar.gz

# download web console
RUN wget https://github.com/janelia-flyem/dvid-console/releases/download/v${CONSOLEVERSION}/dvid-console-${CONSOLEVERSION}.tar.gz && tar -C /usr/local -xzf dvid-console-${CONSOLEVERSION}.tar.gz

# make dvid from git head
RUN mkdir $HOME/go; mkdir -p $DVIDSRC; \
    cd $DVIDSRC; cd ..; \
    git clone https://github.com/janelia-flyem/dvid; \
    cd $DVIDSRC; mkdir build; cd build; \
    cmake -DBUILDEM_DIR=$BUILDEM_DIR ..; \
    make; cmake -D BUILDEM_DIR=$BUILDEM_DIR ..; \
    make dvid

# launch dvid (create new db if necessary)
# consider writing log to file (log would need to be rolled over somehow once inawhile)
ENTRYPOINT if [ ! -d "$DVIDDATA" ]; then mkdir -p $DVIDDATA; dvid create $DVIDDATA/db; fi; \
           ls $DVIDDATA; ls $DVIDDATA/db; \
           dvid -rpc=0.0.0.0:8001 -http=0.0.0.0:8000 -webclient=/usr/local/dvid-console serve $DVIDDATA/db; sleep 15

EXPOSE 8000


