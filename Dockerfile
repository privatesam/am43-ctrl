FROM node:12

# default variables
ENV MAC="02:fb:76:c0:7b:5e"
ENV OPTION="HTTP"
ENV HTTP_PORT="3000"
ENV MQTT_URL="192.168.10.2"
ENV MQTT_PORT="1883"
ENV MQTT_USER="user"
ENV MQTT_PASS="pass"
ENV MQTT_TOPIC="homeassistant"
ENV DEBUG="false"

# set working directory
WORKDIR /usr/src/app

# copy local files
COPY . .

# run
RUN \
  apt-get update && \
  apt-get install jq -y && \
  npm install
