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





FROM nginx:stable-alpine3.20-slim
RUN  apk update && apk add --no-cache openssl
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/key.pem -x509 -days 365 -out /etc/ssl/certificate.cert -subj "/C=MR/ST=KHOURIBGA/L=1337/O=ANASTABITI/CN=wordpress";


