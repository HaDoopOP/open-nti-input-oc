![status experimental](https://img.shields.io/badge/status-experimental-yellow.svg)  

# open-nti-input-oc

OpenConfig input plugin for OpenNTI, based on Telegraf.

# Installation

### 0-Create a local copy of the project

```
git clone https://github.com/Juniper/open-nti-input-oc.git
```

### 1- Clone telegraf project with openconfig_telemetry plugin into open-nti-input-oc project
You need to clone a telegraf project into your open-nti-input-oc project
```
cd open-nti-input-oc
git clone https://github.com/ajhai/telegraf.git
```

### 2- Build juniper/open-nti-input-oc container locally
The container `juniper/open-nti-input-oc` is not published. you need to build it yourself
```
./docker.build.sd
```

# Run / test
There are 2 options to use this project
- with a real junos device (not shipping yet)
- with a simulator / JVSIM

## With a real Junos device

You need to:
- Customize the file `telegraf.conf` with your device IP address and the list of sensor you want.
- Enable gRPC on your junos device

### Customize the configuration file for telegraf

The section `[[inputs.openconfig_telemetry]]` at the bottom you need to customize
- server
- sampleFrequency (in msec)
- sensors

> If you want to have multiple device, you can duplicate the section [[inputs.openconfig_telemetry]]

### Enable gRPC on your device
To enable gRPC on your junos device you need to add these lines of config
```
set system services extension-service request-response grpc clear-text port 50051
set system services extension-service request-response grpc skip-authentication
set system services extension-service notification allow-clients address 0.0.0.0/0
```
> Authentication will by supported later

### Start the plugin
If you want to try, you can start the input-plugin and OpenNTI using the following docker-compose file.

If you want to add the container, as part of a main install of OpenNTI, you need:
- Copy telegraf configuration file at the root of your open-nti project
- Add the input-oc container in the main docker-compose file in the open-nti project directory

You can start both containers (open-nti and telegraf) with docker-compose
```
docker-compose -f docker-compose-junos.yaml up -d
```

## With JVSIM
> If you plan to use jvsim to generate data, you need to build the jvsim container first.
> Instructions are available here : https://github.com/nkumar43212/jvsim

You can start all 3 containers with docker-compose
```
docker-compose -f docker-compose-jvsim up -d
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
