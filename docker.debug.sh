#! /bin/bash

docker run --rm -t \
        -e OUTPUT_INFLUXDB="false" \
        -e OUTPUT_STDOUT="true" \
        -e INFLUXDB_ADDR="172.17.0.3" \
        -v $(pwd)/telegraf.conf:/etc/telegraf/telegraf.conf \
        -i juniper/open-nti-input-oc bash
