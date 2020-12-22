#!/bin/bash
# include function
. ./blue_green_fnc.sh
echo "> Nginx currently proxies to $(CURRENT_PORT)."

# port 확인
toggle_port_number

# Change proxying port into target port
echo "set \$service_url http://${HOST}:${TARGET_PORT};" | tee $SERVICE_URL

echo "> Now Nginx proxies to ${TARGET_PORT}."

# Reload nginx Docker
sudo docker exec -it nginx nginx -s reload

echo "> Nginx Docker reloaded."
