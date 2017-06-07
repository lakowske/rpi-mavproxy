FROM resin/rpi-raspbian:jessie

RUN apt-get update \
    && apt-get install -y \
       python-dev \
       libxml2-dev \
       libxslt-dev \
       python-pip \
       gcc \
       zlib1g-dev \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/*

RUN pip install future
RUN pip install pymavlink
RUN pip install mavproxy

RUN mkdir /app
WORKDIR /app

ENTRYPOINT /usr/loca/bin/mavproxy.py
