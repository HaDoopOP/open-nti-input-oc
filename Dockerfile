FROM golang:1.6.2-wheezy

RUN mkdir /go/src/github.com
RUN mkdir /go/src/github.com/influxdata
WORKDIR /go/src/github.com/influxdata

RUN git clone https://github.com/ajhai/telegraf.git
WORKDIR /go/src/github.com/influxdata/telegraf
