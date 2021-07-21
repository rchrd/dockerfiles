FROM nodered/node-red:1.1.3-12-minimal

RUN npm install -no-cache --no-fund \
  node-red-contrib-home-assistant-websocket@0.33.1 \
  node-red-contrib-presence-faker \
  node-red-contrib-repeat \
  node-red-contrib-schedex \
  node-red-contrib-stoptimer2 \
  node-red-contrib-themes/midnight-red \
  node-red-contrib-time-range-switch

COPY settings.js /usr/src/node-red/node_modules/node-red/settings.js
