# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyospark <hyospark@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/03 23:53:57 by hyospark          #+#    #+#              #
#    Updated: 2021/03/22 18:10:49 by hyospark         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && upgrade
RUN apt-get -y install nginx curl
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
RUN apt-get -y install mariadb-server php-mysql php-mbstring wget
RUN apt-get -y install openssl

RUN docker run -it -p80:80 -p443:443 debian:buster /bin/bash

CMD bash init_container.sh

