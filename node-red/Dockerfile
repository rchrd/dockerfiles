# https://hub.docker.com/r/nodered/node-red/tags?page=1&ordering=last_updated
FROM nodered/node-red:4.0.9-22-minimal

# https://flows.nodered.org/node/node-red-contrib-home-assistant-websocket
RUN npm install -no-cache --no-fund \
  node-red-contrib-home-assistant-websocket@0.77.1 \
  node-red-contrib-presence-faker \
  node-red-contrib-repeat \
  node-red-contrib-schedex \
  node-red-contrib-stoptimer2 \
  node-red-contrib-time-range-switch
