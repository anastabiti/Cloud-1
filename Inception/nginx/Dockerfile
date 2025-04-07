FROM nginx:latest

RUN mkdir -p /etc/ssl/

RUN apt-get update -y && apt-get install openssl -y && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/amrakibe.key \
    -out /etc/ssl/certs/amrakibe.crt \
    -subj "/CN=amrakibe"

COPY ./config/config.conf /etc/nginx/conf.d/nginx.conf

CMD ["nginx", "-g", "daemon off;"]