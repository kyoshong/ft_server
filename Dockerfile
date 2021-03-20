# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyospark <hyospark@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/03 23:53:57 by hyospark          #+#    #+#              #
#    Updated: 2021/03/20 20:32:09 by hyospark         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update
RUN apt -get install -y nginx
RUN apt-get -y install php-fpm vim
RUN apt-get -y install mariadb-server
RUN apt-get -y install php-mysql wget
RUN apt-get -y install openssl
RUN docker run -it -p80:80 -p443:443 debian:buster /bin/bash
RUN service nginx start

RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=localhost" -keyout localhost.dev.key -out localhost.dev.crt