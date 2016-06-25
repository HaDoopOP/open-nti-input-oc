![status experimental](https://img.shields.io/badge/status-experimental-yellow.svg)  

# open-nti-input-oc

OpenConfig input plugin for OpenNTI, based on Telegraf.

# Installation

### 0-Create a local copy of the project


```
git clone https://github.com/Juniper/open-nti-input-oc.git
```

### 1- Clone telegraf project with openconfig_telemetry plugin into open-nti-input-oc project
First, you need to clone a telegraf project into your open-nti-input-oc project
```
cd open-nti-input-oc
git clone https://github.com/ajhai/telegraf.git
```

### 2- Build juniper/open-nti-input-oc container locally
Second, The container `juniper/open-nti-input-oc` is not published. you need to build it yourself
```
./docker.build.sd
```

### 3- Build jvsim container locally (optional)

If you plan to use jvsim to generate data, you need to build the jvsim container first.
Instructions are available here : https://github.com/nkumar43212/jvsim

# Run / test
## With JVSIM

You can start all 3 containers with docker-compose
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

## With real Junos device

You can start both containers (open-nti and telegraf) with docker-compose
```
docker-compose -f docker-compose-junos.yaml up -d
```

# known issues

openconfig_telemetry plugin has hard time to manage lost of session  
It can happen if the gRPC server is not available
