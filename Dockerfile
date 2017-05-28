FROM    alpine:latest

RUN     apk update && \
        apk add aria2

RUN     mkdir -p /root/.aria2

COPY    aria2.conf /root/.aria2/aria2.conf
COPY    start.sh /start.sh
COPY    hook.sh /hook.sh
EXPOSE  6800

CMD     ["/start.sh"]
