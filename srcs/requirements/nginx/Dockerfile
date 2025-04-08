# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atabiti <atabiti@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/08 13:08:23 by atabiti           #+#    #+#              #
#    Updated: 2022/12/02 11:50:57 by atabiti          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# FROM debian:buster
# RUN   apt-get clean && apt-get update --fix-missing
# RUN apt-get -y install nginx openssl
# RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/key.pem -x509 -days 365 -out /etc/ssl/certificate.pem -subj "/C=MR/ST=KHOURIBGA/L=1337/O=ANASTABITI/CN=localhost";
# COPY ./conf/nginx.conf  /etc/nginx/conf.d/nginx.conf
# EXPOSE 443
# CMD ["/usr/sbin/nginx", "-g", "daemon off;"]








# FROM nginx
FROM nginx:stable-alpine3.20-slim
# RUN   apt-get clean && apt-get update --fix-missing
RUN  apk update && apk add --no-cache openssl
# Install OpenSSL for certificate generation
# RUN apt-get update && apt-get install -y openssl
# Generate SSL certificates
# RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/key.pem -x509 -days 365 -out /etc/ssl/certificate.pem -subj "/C=MR/ST=KHOURIBGA/L=1337/O=ANASTABITI/CN=localhost";
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/key.pem -x509 -days 365 -out /etc/ssl/certificate.cert -subj "/C=MR/ST=KHOURIBGA/L=1337/O=ANASTABITI/CN=wordpress";



# # Copy Nginx configuration i removed this 
# COPY ./conf/nginx.conf  /etc/nginx/conf.d/nginx.conf
# Expose HTTPS port
EXPOSE 80 443 

# # # Use the default Nginx command
# CMD ["nginx", "-g", "daemon off;"]




# Docker always monitors the process with PID 1
#we are going to run Nginx whenever our Docker image launches:
#the -g option specifies a directive to nginx
#the daemon off directive will disable the self-daemonizing behavior of nginx
#MANUAL
#req — to specify we want to use -x509
#-x509 — to specify we want to create a self-signed certificate instead of generating a certificate signing request.
#-nodes — makes it so that we skip the option to secure our certificate with a passphrase, so that nginx can read it.
#-days 365 — specifies how long the certificate would be valid for, which is 365 days.
#-subj “/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" — this allows us to specify subject without filling in prompts.
#-newkey rsa:2048  specifies that we want to generate a new key with an RSA key of 2048 bits.
######
# If you add a custom CMD in the Dockerfile, be sure to include -g daemon off;
# in the CMD in order for nginx to stay in the foreground, 
# so that Docker can track the process properly (otherwise your container will stop immediately after starting)!
