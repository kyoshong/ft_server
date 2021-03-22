# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyospark <hyospark@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/03 23:53:57 by hyospark          #+#    #+#              #
#    Updated: 2021/03/23 02:22:00 by hyospark         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && upgrade
RUN apt-get -y install nginx curl wget vim
RUN apt-get -y install php7.3-fpm php7.3-mysql
RUN apt-get -y install mariadb-server
RUN apt-get -y install openssl

# RUN docker run -it -p80:80 -p443:443 debian:buster /bin/bash

COPY ./srcs/init.sh ./
COPY ./srcs/nginx-conf ./tmp/nginx-conf
COPY ./srcs/phpmyadmin.inc.php ./tmp/phpmyadmin.inc.php
COPY ./srcs/wp-config.php ./tmp/wp-config.php

CMD bash init.sh

