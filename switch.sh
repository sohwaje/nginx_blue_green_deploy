#!/bin/bash
. blue_green_fnc.sh
# Crawl current connected port of WAS
# SERVICE_URL="nginx/service_url.inc"
# CURRENT_PORT=$(cat $SERVICE_URL | grep -Po '[0-9]+' | tail -1)
# TARGET_PORT=0
CURRENT_PORT=$(CURRENT_PORT)

echo "> Nginx currently proxies to ${CURRENT_PORT}."

# Toggle port number
# if [ ${CURRENT_PORT} -eq 8081 ]; then
#     TARGET_PORT=8082
# elif [ ${CURRENT_PORT} -eq 8082 ]; then
#     TARGET_PORT=8081
# else
#     echo "> No WAS is connected to nginx"
#     exit 1
# fi
toggle_port_number

# Change proxying port into target port
echo "set \$service_url http://${HOST}:${TARGET_PORT};" | tee $SERVICE_URL

echo "> Now Nginx proxies to ${TARGET_PORT}."

# Reload nginx
sudo docker exec -it nginx nginx -s reload

echo "> Nginx reloaded."
