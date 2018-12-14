FROM ubuntu:16.04
MAINTAINER Stephen Plaza <plazas@janelia.hhmi.org>

# set environment variables
# ENV GOVERSION 1.11.2
# ENV GOROOT /usr/local/go
# ENV GOPATH=$HOME/go

# ENV DVIDCONSOLEVERSION 3.0.1
ARG DVIDHOME=/opt/dvid
ENV DVIDHOME ${DVIDHOME}
ENV DVIDVERSION 0.8.21
# ENV DVIDSRC=$GOPATH/src/github.com/janelia-flyem/dvid
ENV DVIDDATA /var/dvid

# ENV BUILDEM_DIR $HOME/buildem
# ENV LD_LIBRARY_PATH $BUILDEM_DIR/lib:$LD_LIBRARY_PATH
# ENV PATH /usr/local/go/bin:$BUILDEM_DIR/bin:$PATH
ENV PATH $DVIDHOME/bin:$PATH

# install basic dependencies
RUN apt-get -yq update && apt-get install -yq --no-install-recommends \
    ca-certificates \
    bzip2 \
    git \
    make \
    g++ \
    wget \
    mercurial \
    zip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# install dockerize

ENV DOCKERIZE_VERSION v0.6.1
RUN wget -q https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# install dvid

RUN wget https://github.com/janelia-flyem/dvid/releases/download/v${DVIDVERSION}/dvid-${DVIDVERSION}-dist-linux.tar.bz2 -q -O /tmp/dvid.tar.bz2\
  && mkdir /opt/dvid \
  && tar -C /opt/dvid -xjf /tmp/dvid.tar.bz2 --strip 1\
  && rm -f /tmp/dvid.tar.bz2

# copy config

COPY ./config/* $DVIDHOME/config/
COPY ./dvid.sh $DVIDHOME/bin/dvid.sh

# create a log file so dockerize can hook into it before dvid is started by dockerize
RUN touch /var/log/dvid.log

# download web console
# RUN wget https://github.com/janelia-flyem/dvid-console/releases/download/v${DVIDCONSOLEVERSION}/dvid-console-${DVIDCONSOLEVERSION}.tar.gz \
  # -q -O /tmp/dvidconsole.tar.gz \
  # && tar -C /usr/local -xzf /tmp/dvidconsole.tar.gz \
  # &&  rm -f /tmp/dvidconsole.tar.gz
#
# make dvid from git head
# RUN mkdir $HOME/go; mkdir -p $DVIDSRC; \
    # cd $DVIDSRC; cd ..; \
    # git clone https://github.com/janelia-flyem/dvid; \
    # cd $DVIDSRC; git checkout v${DVIDVERSION}; mkdir build; cd build; \
    # cmake -DDVID_BACKEND="basholeveldb;gbucket" -DBUILDEM_DIR=$BUILDEM_DIR ..; \
    # make; cmake -D BUILDEM_DIR=$BUILDEM_DIR ..; \
    # make dvid; \
    # cd $GOPATH/src/google.golang.org/cloud; git reset --hard 8bc2457bef5a52c10b0001d481d441141095b130; go install; \
    # cd $DVIDSRC/build; make dvid; \
    # chmod +x /usr/local/bin/dvid.sh

# no argument: launch dvid (creates new db in /var/dvid/db unless already provided)
# one argument: specify google bucket containing dvid instance
# logs are written to /data/logs
ENTRYPOINT ["dockerize", "-stdout", "/var/log/dvid.log", "dvid.sh"]
CMD [""]

EXPOSE 8000
