FROM node:20-alpine as node20

FROM composer:2

RUN apk update

RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli

# install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# install nodejs
COPY --from=node20 /usr/lib /usr/lib
COPY --from=node20 /usr/local/share /usr/local/share
COPY --from=node20 /usr/local/lib /usr/local/lib
COPY --from=node20 /usr/local/include /usr/local/include
COPY --from=node20 /usr/local/bin /usr/local/bin

# install yarn
RUN apk add yarn

WORKDIR /wp-app

# COPY wordpress/composer.json .
# COPY wordpress/composer.lock .

# RUN composer install

# COPY wordpress/web/app/themes/sage/composer.json ./bedrock/web/app/themes/sage/.
# COPY wordpress/web/app/themes/sage/composer.lock ./bedrock/web/app/themes/sage/.

# RUN composer install

# COPY wordpress/web/app/themes/sage/package.json ./bedrock/web/app/themes/sage/.
# COPY wordpress/web/app/themes/sage/yarn.lock ./bedrock/web/app/themes/sage/.

# RUN yarn

# COPY ./.docker/composer/setup.sh /docker-setup/setup-composer.sh
# COPY ./.docker/composer/.env docker-setup/.env

# RUN chmod +rwx /dock'er-setup/setup-composer.sh

CMD tail -F anything
# CMD /docker-setup/setup-composer.sh