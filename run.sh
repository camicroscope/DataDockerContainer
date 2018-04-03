#!/bin/bash
#nohup /usr/bin/mongod &
mongod --config /etc/mongod.conf &
sh /root/bindaas/bin/startup.sh &
#preload camicroscope template
sleep 5
mongo 127.0.0.1:27017/quip /root/bindaas/bin/db_index.js
mongo 127.0.0.1:27017/quip_comp /root/bindaas/bin/db_index.js
mongo < /root/bindaas/bin/loadCamicroscopeTemplate.js
mongo < /root/bindaas/bin/load_admin_info.js
while true; do sleep 1000; done
