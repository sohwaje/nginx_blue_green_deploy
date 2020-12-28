FROM nginx:latest
MAINTAINER sohwaje <sohwaje@gmail.com>

RUN mkdir /etc/nginx/sites-available
RUN mkdir /etc/nginx/sites-enabled
RUN mkdir /var/log/nginx/blue_logs


ADD /nginx/default_catchall.html /usr/share/nginx/html
# COPY /nginx/cert.pem /etc/nginx/conf.d
# COPY /nginx/key.pem /etc/nginx/conf.d
CMD ["nginx", "-g", "daemon off;"]
