FROM    alpine:latest

RUN     apk update && \
        apk add nginx git && \
        git clone https://github.com/ziahamza/webui-aria2.git /var/www/webui && \
        apk del git
COPY    default.conf    /etc/nginx/conf.d/default.conf

EXPOSE  80

CMD     nginx -g daemon off
