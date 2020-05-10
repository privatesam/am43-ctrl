# iluvcrong/am43-ctrl
Docker image for controlling a am43 Cover, either over MQTT or via a HTTP API. When used over MQTT it works together with home-assistant and performs auto disovery configuration of the cover component.
(Eg. https://nl.aliexpress.com/item/4000106179323.html)
This util should work with all blind drives which make use of the Blind Engine App. (A-OK, Zemismart,...)

## Usage
```bash
docker create \
    --name=<your-container-name> \
    -v <path-of-config>:/config \
    --net=host
    iluvcrong/am43-ctrl
```

## Parameters
* `-v /config` - options for your blind controller

## Options
See /config/config.json

```json
{
  "mac1" : "02:FB:76:C0:7B:5E",
  "mac2" : "",
  "service": "http",
  "http": {
    "port": 3000
  },
  "mqtt": {
    "broker_url": "mqtt://192.168.10.2",
    "topic": "homeassistant",
    "username": "your-username",
    "password": "your-password"
  },
  "debug": false
}
```

* `mac1` - mac address of 1st blind controller, empty string("") is ok.
* `mac2` - mac address of 2st blind controller, empty string("") is ok.
* `service` - http, mqtt or both (http+mqtt)
* `http.port` - http service port
* `mqtt.broker_url` - broker url of your mosquitto server
* `mqtt.topic` - base topic for mosquitto
* `mqtt.username` - username for authorizing mosquitto
* `mqtt.password` - password for authorizing mosquitto
* `debug` - enable/disable debug logging

## References
* Base image: [node:12](https://hub.docker.com/_/node/)
* binsentsu/am43-ctrl: https://github.com/binsentsu/am43-ctrl
