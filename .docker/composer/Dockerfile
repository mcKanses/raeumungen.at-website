FROM composer:2

RUN apk update

RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /wp-app

COPY ./.docker/composer/setup.sh /docker-setup/setup-composer.sh
COPY ./.docker/composer/.env docker-setup/.env

RUN chmod +rwx /docker-setup/setup-composer.sh

CMD /docker-setup/setup-composer.sh