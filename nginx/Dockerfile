FROM nginx:latest
MAINTAINER sohwaje <sohwaje@gmail.com>

RUN mkdir /etc/nginx/sites-available
RUN mkdir /etc/nginx/sites-enabled
RUN mkdir /var/log/nginx/blue_logs

# COPY /nginx/nginx.conf /etc/nginx/nginx.conf
# COPY /nginx/service_url.inc /etc/nginx
# COPY /nginx/server.rewrites /etc/nginx/server.rewrites
# COPY /nginx/general-security-headers.conf /etc/nginx/conf.d/general-security-headers.conf
# COPY /nginx/cert.pem /etc/nginx/conf.d
# COPY /nginx/hiclass.pem /etc/nginx/conf.d
# RUN ln -s /etc/nginx/sites-available/blue.conf /etc/nginx/sites-enabled/blue.conf
# ADD load_pagespeed_module.conf /usr/local/nginx/conf/conf.d/load_pagespeed_module.conf
CMD ["nginx", "-g", "daemon off;"]
