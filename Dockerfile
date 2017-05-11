FROM    alpine:latest

RUN     apk update && \
        apk add -y aria2 nginx git

RUN     mkdir -p $HOME/.aria2 && \
        mkdir /run/nginx && \
        git clone https://github.com/ziahamza/webui-aria2.git /var/www/webui

COPY    aria2.conf      /root/.aria2/aria2.conf
COPY    default.conf    /etc/nginx/conf.d/default.conf
COPY    start.sh        /start.sh
COPY    hook.sh         /hook.sh
EXPOSE  80 6800

CMD     ["/start.sh"]