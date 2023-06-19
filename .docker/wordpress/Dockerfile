FROM wordpress:php8.2-apache


RUN apt-get update -y && \
    apt-get install -y \
        libzip-dev \
        zip

# install php extensions
RUN docker-php-ext-install zip mysqli pdo pdo_mysql \
    && docker-php-ext-enable pdo_mysql

# install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

# install node & npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt update && apt install -y nodejs gcc g++ make -y

# install yarn
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt update && apt-get install yarn -y

WORKDIR /var/www/html/bedrock

COPY wordpress/composer.json .
COPY wordpress/composer.lock .

RUN composer install

WORKDIR /var/www/html/bedrock/web/app/themes/sage

COPY wordpress/web/app/themes/sage/composer.json .
COPY wordpress/web/app/themes/sage/composer.lock .
COPY wordpress/web/app/themes/sage/package.json .
COPY wordpress/web/app/themes/sage/yarn.lock .

RUN composer install && yarn

WORKDIR /var/www/html

COPY wordpress/. bedrock/.

RUN chown -R www-data:www-data bedrock/