#!/bin/bash
set -e

CONFIG_PATH=/config/config.json

# copy config.yml
[[ -f $CONFIG_PATH ]] && \
  { echo "Using existing config.json"; } || \
	{ echo "New config.json from template"; cp /usr/src/app/config/config.json $CONFIG_PATH; }

#MAC_ADDR=$(jq -r ".mac" $CONFIG_PATH)
#SERVICE=$(jq -r ".service" $CONFIG_PATH)
#HTTP_PORT=$(jq -r ".http.port" $CONFIG_PATH)
#MQTT_BROKER_URL=$(jq -r ".mqtt.broker_url" $CONFIG_PATH)
#MQTT_PORT=$(jq -r ".mqtt.port" $CONFIG_PATH)
#MQTT_TOPIC=$(jq -r ".mqtt.topic" $CONFIG_PATH)
#MQTT_USERNAME=$(jq -r ".mqtt.username" $CONFIG_PATH)
#MQTT_PASSWORD=$(jq -r ".mqtt.password" $CONFIG_PATH)

node index.js 02:fb:76:c0:7b:5e -l 3000
