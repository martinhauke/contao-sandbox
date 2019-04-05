FROM php:7-apache
LABEL version="0.1.1" \
      description="Docker Image for a contao installation" \
      maintainer="hauke@september-werbeagentur.de"
RUN set -ex; \
	apt-get update && apt-get install -y \
		libicu-dev \
		libjpeg-dev \
		libpng-dev \
		libgmp-dev \
		libmcrypt-dev \
		libxml2-dev \
		mysql-common \
		libbz2-dev \
		zlib1g-dev \
		libzip-dev \
		vim \
		libmagickwand-dev \
	; \
	apt-get clean; \
	rm -rf /var/lib/apt/lists/*; \
	ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/local/include/; \
        pecl install imagick; \
	export CFLAGS="-I/usr/src/php" ;\
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
        docker-php-ext-enable imagick; \
	docker-php-ext-install pdo pdo_mysql gd mysqli gmp bcmath zip xmlwriter xmlreader iconv bz2 mbstring soap intl
RUN a2enmod rewrite expires
RUN set -ex; \
        # set the correct document root
        perl -pi -e "s#/var/www/html#/var/www/html/web#" /etc/apache2/sites-available/000-default.conf ; \
        perl -pi -e "s#/var/www/html#/var/www/html/web#" /etc/apache2/sites-available/default-ssl.conf ;\
	echo "date.timezone = 'Europe/Berlin'\n" >> /usr/local/etc/php/php.ini
RUN useradd -u 1000 glados
VOLUME /var/www/html
CMD ["apache2-foreground"]