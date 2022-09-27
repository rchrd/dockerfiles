# https://hub.docker.com/r/nodered/node-red/tags?page=1&ordering=last_updated
FROM nodered/node-red:2.2.3-12-minimal

# https://flows.nodered.org/node/node-red-contrib-home-assistant-websocket
RUN npm install -no-cache --no-fund \
  node-red-contrib-home-assistant-websocket@0.45.0 \
  node-red-contrib-presence-faker \
  node-red-contrib-repeat \
  node-red-contrib-schedex \
  node-red-contrib-stoptimer2 \
  node-red-contrib-time-range-switch
