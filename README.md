![status experimental](https://img.shields.io/badge/status-experimental-yellow.svg)  

# open-nti-input-oc

OpenConfig input plugin for OpenNTI, based on Telegraf.


# Installation

### 1- Clone telegraf project with openconfig_telemetry plugin into open-nti-input-oc project
First, you need to clone a telegraf project into your open-nti-input-oc project
```
git clone https://github.com/ajhai/telegraf.git
```

### 2- Build juniper/open-nti-input-oc container locally
Second, The container `juniper/open-nti-input-oc` is not published. you need to build it yourself
```
./docker.build.sd
```

### 3- Build jvsim container locally

you need to build the jvsim container,
Instructions are available here : https://github.com/nkumar43212/jvsim

# Run / test

you can start all 3 containers with docker-compose
```
docker-compose up -d
```
It will start 3 containers:
- opennti with influxdb for the database
- jvsim to simulate an openconfig server
- telegraf to collect from openconfig and send to opennti

you can check each container status by looking at the logs

```
docker logs openntiinputoc_jvsim_1

```

jvsim server will take 10-20s to start

# known issues

openconfig_telemetry plugin has hard time to manage lost of session  
It can happen if the gRPC server is not available
