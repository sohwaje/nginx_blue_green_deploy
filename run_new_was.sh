#!/bin/bash
:<<'END'
# ervice_url.inc 에서 현재 서비스를 하고 있는 WAS의 포트 번호를 읽어옵니다.
> cat service_url.inc | grep -Po '[0-9]+'
127
0
0
1
8081
END
. blue_green_fnc.sh

# # APP 홈디렉토리
# APP_BASE="/home/azureuser/apps"
# # 현재 사용 중인 Port를 service_url.inc에 가져온다.
# SERVICE_URL="nginx/service_url.inc"
# CURRENT_PORT=$(cat $SERVICE_URL | grep -Po '[0-9]+' | tail -1)
# # TARGET_PORT는 아래 if문에 따라 결정된다.
# TARGET_PORT=0

echo "> Current port of running WAS is $(CURRENT_PORT)."

# 현재 포트 조건이 참이면 포트를 변경한다.
# if [ ${CURRENT_PORT} -eq 8081 ]; then
#   TARGET_PORT=8082
# elif [ ${CURRENT_PORT} -eq 8082 ]; then
#   TARGET_PORT=8081
# else
#   echo "> No WAS is connected to nginx"
# fi
toggle_port_number

# TARGET_PORT로 TARGET_PID를 찾는다.
TARGET_PID=$(lsof -Fp -i TCP:${TARGET_PORT} | grep -Po 'p[0-9]+' | grep -Po '[0-9]+')

# TARGET_PID가 빈 문자열이 아니면, TARGET_PID를 죽인다.(만약 타겟포트에도 WAS가 실행중이면 죽인다.)
if [ ! -z ${TARGET_PID} ]; then
  echo "> Kill WAS running at ${TARGET_PORT}."
  sudo kill ${TARGET_PID}
fi

# app 실행
nohup java -jar -Dserver.port=${TARGET_PORT} ${APP_BASE}/$(latest_jar) > /dev/null 2>&1 &

echo "> Now new WAS runs at ${TARGET_PORT}."
exit 0
