#! /bin/bash

docker run --rm -t \
        -e OUTPUT_INFLUXDB="false" \
        -e OUTPUT_STDOUT="true" \
        -e INFLUXDB_ADDR="172.17.0.3" \
        -i juniper/open-nti-input-oc bash
