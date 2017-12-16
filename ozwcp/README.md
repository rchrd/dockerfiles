# Open Zwave Control Panel

This container provides the Open Zwave Control Panel exposing the web server on the default port of 8090.

Example run command:
```
docker run \
  --detach \
  --name="ozwcp" \
  -p 8090:8090 \
  --device=/dev/ttyACM0:/dev/zwave:rwm \
  --volume /etc/hass/zwcfg_0xe0d69ae3.xml:/install/open-zwave-control-panel/zwcfg_0xe0d69ae3.xml \
  rchrd/ozwcp
```
