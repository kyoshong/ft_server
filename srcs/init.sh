# 권한 설정
chmod 775 /init.sh
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

#ssl
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=localhost" -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt
chmod 600 /etc/nginx/ssl/localhost.crt /etc/nginx/ssl/localhost.key

rm -rf /etc/nginx/sites-available/default
# nginx 파일 이전
mv /tmp/nginx-conf /etc/nginx/sites-available/default

# wordpress 설정
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/ /var/www/html/
chown -R www-data:www-data /var/www/html/wordpress
cp -rp ./tmp/wp-config.php /var/www/html/wordpress

# MYSQL
service mysql start
echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root --skip-password
echo "CREATE USER IF NOT EXISTS 'hyospark'@'localhost' IDENTIFIED BY 'hyospark';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'hyospark'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password

# phpmyadmin 설정
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv phpmyadmin /var/www/html/
rm phpMyAdmin-5.0.2-all-languages.tar.gz
cp -rp /tmp/phpmyadmin.inc.php /var/www/html/phpmyadmin/config.inc.php

# phpmyadmin 데이타베이스 생성
#mysql -u root --skip-password < var/www/html/phpmyadmin/sql/create_tables.sql

service nginx start
service php7.3-fpm start
bash
