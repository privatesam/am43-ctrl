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
```json
{
  "mac1" : "02:FB:76:C0:7B:5E",             // mac address of 1st blind controller
  "mac2" : "",                              // mac address of 2st blind controller
  "service": "http",                        // service: http, mqtt or both (http+mqtt)
  "http": {
    "port": 3000                            // http service port
  },
  "mqtt": {
    "broker_url": "mqtt://192.168.10.2",    // mqtt broker url
    "topic": "homeassistant",               // topic for mqtt
    "username": "your-username",            // username for authorizing mqtt
    "password": "your-password"             // password for authorizing mqtt (do not use special chars)
  },
  "debug": false                            // enable/disable debug log
}
```

## References
* Base image: [node:12](https://hub.docker.com/_/node/)
* binsentsu/am43-ctrl: https://github.com/binsentsu/am43-ctrl
