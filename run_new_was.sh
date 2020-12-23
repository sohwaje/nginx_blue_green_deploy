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
# include function
. ./blue_green_fnc.sh
echo "> Current port of running WAS is $(CURRENT_PORT)."

# port 확인
toggle_port_number

# # TARGET_PORT로 TARGET_PID를 찾는다.
# TARGET_PID=$(lsof -Fp -i TCP:${TARGET_PORT} | grep -Po 'p[0-9]+' | grep -Po '[0-9]+')

# TARGET_PID가 빈 문자열이 아니면, TARGET_PID를 죽인다.(만약 타겟포트에도 WAS가 실행중이면 죽인다.)
if [ ! -z $(TARGET_PID) ]; then
  echo "> Kill WAS running at ${TARGET_PORT}."
  sudo kill $(TARGET_PID)
fi

# app 실행
nohup java -jar -Dserver.port=${TARGET_PORT} ${APP_BASE}/$(latest_jar) > /dev/null 2>&1 &

echo "> Now new WAS runs at ${TARGET_PORT}."
exit 0
