FROM    alpine:latest

RUN     apk update && \
        apk add -y aria2 nginx git

RUN     mkdir -p $HOME/.aria2 && \
        mkdir /run/nginx && \
        git clone https://github.com/ziahamza/webui-aria2.git /var/www/webui

RUN     wget -O /ac https://github-cloud.s3.amazonaws.com/releases/90930175/c03d7232-3666-11e7-806e-80512a920b02?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAISTNZFOVBIJMK3TQ%2F20170511%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20170511T083000Z&X-Amz-Expires=300&X-Amz-Signature=a5fb9188a51be36581b40c1116448c47a29eb9ddf78975c334ad8cbd0dd1cfc9&X-Amz-SignedHeaders=host&actor_id=8232737&response-content-disposition=attachment%3B%20filename%3Daria2Client&response-content-type=application%2Foctet-stream && \
        chmod 755 /ac

COPY    aria2.conf      /root/.aria2/aria2.conf
COPY    default.conf    /etc/nginx/conf.d/default.conf
COPY    start.sh        /start.sh
COPY    hook.sh         /hook.sh
EXPOSE  80 6800

CMD     ["/start.sh"]