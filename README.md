# nginx를 활용한 Blue Green 배포 스크립트

## Git clone
- 서버에서 아래와 git clone을 통해 소스 코드를 복제합니다.
```
git clone https://github.com/sohwaje/nginx_blue_green_deploy.git
```

## Start Nginx Docker
- nginx docker 이미지를 빌드하고 실행합니다.
```
docker-compose up -d --build
```

## Deploy Sample Java application
- 특정 디렉토리에 첫 번째 개발물을 배포합니다.(젠킨스 또는 기타 툴을 이용)

## Start blue-green script
- 두 번째 개발물을 배포하고, nginx에서 스위칭시킵니다.
```
sh start.sh
```
