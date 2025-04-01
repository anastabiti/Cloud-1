# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atabiti <atabiti@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/08 13:08:46 by atabiti           #+#    #+#              #
#    Updated: 2022/12/02 11:36:07 by atabiti          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CMD:
	sudo	mkdir -p /home/atabiti/data/database /home/atabiti/data/wordpress
	 cd srcs &&   sudo docker-compose up --build
stop:
	 cd srcs && sudo docker-compose down
fclean: stop
	 cd /home/atabiti/data/database && sudo  rm -rf  *
	cd /home/atabiti/data/wordpress  && sudo rm -rf  *
	# docker rm -r $(docker ps -a -f status=exited -q)
	sudo docker system prune -a 
	sudo docker volume prune