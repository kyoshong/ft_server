service nginx start
service nginx status
#ssl
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj \
"/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=localhost" -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt

chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

vim /etc/nginx/sites-available/default

service nginx reload

# wordpress 설정
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/ var/www/html/

chown -R www-data:www-data /var/www/html/wordpress
cp -rp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php 
vim var/www/html/wordpress/wp-config.php 
# phpmyadmin 설정
apt-get install -y wget
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv phpmyadmin /var/www/html/

cp -rp /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php 


# MYSQL
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

service php7.3-fpm restart