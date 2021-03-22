service nginx start
service nginx status

openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj \
"/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=localhost" -keyout localhost.dev.key -out localhost.dev.crt

mv localhost.dev.crt etc/ssl/certs/
mv localhost.dev.key etc/ssl/private/
chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

vim etc/nginx/sites-available/default

service nginx reload

wget https://wordpress.org/latest.tar.gz

tar -xvf latest.tar.gz
mv wordpress/ var/www/html/
chown -R www-data:www-data /var/www/html/wordpress
cp -rp var/www/html/wordpress/wp-config-sample.php var/www/html/wordpress/wp-config.php 

service mysql start
mysql
CREATE DATABASE wordpress;
CREATE USER 'hyospark'@'localhost' IDENTIFIED BY 'hyospark';
GRANT ALL PRIVILEGES ON wordpress.* TO 'hyospark'@'localhost' WITH GRANT OPTION;
USE wordpress;
SHOW TABLES;


service php7.3-fpm restart
