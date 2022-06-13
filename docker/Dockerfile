FROM php:7-fpm-buster
RUN mkdir /app
RUN apt-get update
RUN apt-get install nginx git openssh-server sudo -y

# nginx site-enabled/defautの設定
COPY docker/resources/nginx_site_enabled_default /etc/nginx/sites-enabled/default

# composerインストール
WORKDIR /tmp
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# enable sshd
RUN mkdir /var/run/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22

# ssh auth
RUN mkdir /root/.ssh
COPY docker/resources/test_key /root/.ssh/id_rsa
COPY docker/resources/test_key.pub /root/.ssh/id_rsa.pub
RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 644 /root/.ssh/id_rsa.pub
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN chmod 644 /root/.ssh/authorized_keys

WORKDIR /app
EXPOSE 80

COPY docker/resources/command.sh /usr/sbin
RUN chmod +x /usr/sbin/command.sh
CMD ["/usr/sbin/command.sh"]
