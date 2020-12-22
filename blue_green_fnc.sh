#!/bin/bash

# JAVA APP 홈디렉토리
APP_BASE="/home/azureuser/apps"

# Service IP or Host
HOST="10.1.0.19"

# 현재 사용 중인 Port를 service_url.inc에 가져온다.
SERVICE_URL="nginx/service_url.inc"
# CURRENT_PORT=$(cat $SERVICE_URL | grep -Po '[0-9]+' | tail -1)
CURRENT_PORT()
{
  cat $SERVICE_URL | grep -Po '[0-9]+' | tail -1
}

# TARGET_PORT는 toggle_port_number 함수에 의해 결정된다.
TARGET_PORT=0

# 가장 최근에 만들어진 jar 파일 찾기
latest_jar()
{
  ls -ltr $APP_BASE | grep ".jar" | grep -v grep | awk '{print $NF}' | grep -v ^$ |tail -n1
}

# Toggle port Number
toggle_port_number()
{
  if [ $(CURRENT_PORT) -eq 8081 ]; then     # 현재 포트가 8081이면 TARGET_PORT = 8082로 설정
      TARGET_PORT=8082
  elif [ $(CURRENT_PORT) -eq 8082 ]; then   # 현재 포트가 8082면 TARGET_PORT = 8081로 설정
      TARGET_PORT=8081
  else
      echo "> No WAS is connected to nginx"
      exit 1
  fi
}
