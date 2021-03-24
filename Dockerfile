# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyospark <hyospark@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/03 23:53:57 by hyospark          #+#    #+#              #
#    Updated: 2021/03/24 16:15:43 by hyospark         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get -y install nginx curl wget vim
RUN apt-get -y install php-fpm php-mysql php-mbstring
RUN apt-get -y install mariadb-server
RUN apt-get -y install openssl

# docker run -it --name debian -p 80:80 -p 443:443 debian:buster

COPY ./srcs/init.sh ./
COPY ./srcs/nginx-conf ./tmp/nginx-conf
COPY ./srcs/phpmyadmin.inc.php ./tmp/phpmyadmin.inc.php
COPY ./srcs/wp-config.php ./tmp/wp-config.php

CMD bash init.sh

