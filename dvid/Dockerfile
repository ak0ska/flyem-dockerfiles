FROM ubuntu:16.04
MAINTAINER Stephen Plaza <plazas@janelia.hhmi.org>

ENV DVIDHOME /opt/dvid
ENV DVIDVERSION 0.8.21
ENV DVIDDATA /var/dvid
ENV PATH $DVIDHOME/bin:$PATH

# install basic dependencies and some convenience tools
RUN apt-get -yq update && apt-get install -yq --no-install-recommends \
    ca-certificates \
    bzip2 \
    git \
    make \
    g++ \
    wget \
    mercurial \
    zip \
    vim \
    less \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# install dvid

RUN wget https://github.com/janelia-flyem/dvid/releases/download/v${DVIDVERSION}/dvid-${DVIDVERSION}-dist-linux.tar.bz2 -q -O /tmp/dvid.tar.bz2\
  && mkdir /opt/dvid \
  && tar -C /opt/dvid -xjf /tmp/dvid.tar.bz2 --strip 1\
  && rm -f /tmp/dvid.tar.bz2

# copy config

COPY ./config/* $DVIDHOME/config/
COPY ./dvid.sh $DVIDHOME/bin/dvid.sh

# no argument: launch dvid (creates new db in /var/dvid/db unless already provided)
# one argument: specify google bucket containing dvid instance
# logs are written to /data/logs
ENTRYPOINT ["dvid.sh"]
CMD [""]

EXPOSE 8000
