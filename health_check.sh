#!/bin/bash
:<<'END'
# 새로 띄운 WAS가 완전히 실행되기까지 health check 하는 스크립트
END
# include function
. ./blue_green_fnc.sh

# port 확인
toggle_port_number
echo "> Start health check of WAS at 'http://${HOST}:${TARGET_PORT}' ..."

for RETRY_COUNT in {1..10}
do
    echo "> #${RETRY_COUNT} trying..."
    # RESPONSE_CODE=$(curl -s -o /dev/null -w "%{http_code}"  http://127.0.0.1:${TARGET_PORT}/health)
    RESPONSE_CODE=$(curl -s -o /dev/null -w "%{http_code}"  http://${HOST}:${TARGET_PORT}/)
    if [ ${RESPONSE_CODE} -eq 200 ]; then
        echo "> New WAS successfully running"
        exit 0
    elif [ ${RETRY_COUNT} -eq 10 ]; then
        echo "> Health check failed."
        exit 1
    fi
    sleep 10
done
