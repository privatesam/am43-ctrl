#!/bin/bash
set -e

CONFIG_PATH=/config/config.json

# copy config.yml
[[ -f $CONFIG_PATH ]] && \
  { echo "Using existing config.json"; } || \
	{ echo "New config.json from template"; cp /usr/src/app/config/config.json $CONFIG_PATH; }

MAC1_ADDR=$(jq -r ".mac1" $CONFIG_PATH)
MAC2_ADDR=$(jq -r ".mac2" $CONFIG_PATH)
SERVICE=$(jq -r ".service" $CONFIG_PATH)
HTTP_PORT=$(jq -r ".http.port" $CONFIG_PATH)
MQTT_BROKER_URL=$(jq -r ".mqtt.broker_url" $CONFIG_PATH)
MQTT_TOPIC=$(jq -r ".mqtt.topic" $CONFIG_PATH)
MQTT_USERNAME=$(jq -r ".mqtt.username" $CONFIG_PATH)
MQTT_PASSWORD=$(jq -r ".mqtt.password" $CONFIG_PATH)
DEBUG=$(jq -r ".debug" $CONFIG_PATH)

OPTIONS=""

# check mac address
if [[ "$MAC1_ADDR" =~ ^([a-fA-F0-9]{2}:){5}[a-fA-F0-9]{2}$ ]]; then
	echo "Mac Address #1 is valid."
	OPTIONS+="${MAC1_ADDR,,} "
else
	echo "Mac Address #1 is invalid."
fi

if [[ "$MAC2_ADDR" =~ ^([a-fA-F0-9]{2}:){5}[a-fA-F0-9]{2}$ ]]; then
        echo "Mac Address #2 is valid."
	OPTIONS+="${MAC2_ADDR,,} "
else
        echo "Mac Address #2 is invalid."
fi

# check service
if [ "$SERVICE" == "http" ]; then
	echo "Service: HTTP"
	OPTIONS+="-l $HTTP_PORT "
elif [ "$SERVICE" == "mqtt" ]; then
	echo "Service: MQTT"
	OPTIONS+="--url $MQTT_BROKER_URL --topic $MQTT_TOPIC --mqtt-username=$MQTT_USERNAME --mqtt-password=$MQTT_PASSWORD "
elif [ "$SERVICE" == "both" ]; then
	echo "Service: HTTP and MQTT"
	OPTIONS+="-l $HTTP_PORT --url $MQTT_BROKER_URL --topic $MQTT_TOPIC --mqtt-username=$MQTT_USERNAME --mqtt-password=$MQTT_PASSWORD "
fi

# check debug mode
if [ "$DEBUG" == "true" ]; then
	echo "Debug: On"
	OPTIONS+="-d "
else
	echo "Debug: Off"
fi

echo "OPTIONS: $OPTIONS"

node index.js $OPTIONS

