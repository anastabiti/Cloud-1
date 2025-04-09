FROM nginx:mainline-alpine-perl


RUN mkdir -p /etc/ssl/private /etc/ssl/certs

RUN apk update && apk add openssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/amrakibe.key \
    -out /etc/ssl/certs/amrakibe.crt \
    -subj "/CN=amrakibe"

COPY ./config/config.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]