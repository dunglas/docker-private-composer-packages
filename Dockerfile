FROM php:alpine

WORKDIR /srv/app

# These packages haven't to be installed if you have a composer.lock file, which is a best practice
RUN apk add --no-cache git openssh-client

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Copy the composer.json and composer.lock files
COPY composer.* .

# Install the dependencies by allowing Docker to use the auth.json file of the host
RUN --mount=type=secret,id=composer_auth,dst=/srv/app/auth.json composer install --prefer-dist --no-scripts --no-autoloader --no-progress --no-interaction

# auth.json must not be copied into the final image
COPY . .
