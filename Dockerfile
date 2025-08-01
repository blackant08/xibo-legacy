FROM php:5.6-apache

# Ganti source dan disable valid-until
RUN echo "deb http://archive.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf.d/99no-check-valid-until

# Install semua dependency
RUN apt-get update && apt-get install -y --allow-unauthenticated \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    libmcrypt-dev \
    unzip \
    curl \
    libgettextpo-dev \
    libicu-dev \
    zlib1g-dev \
    libxslt1-dev \
    libonig-dev \
    libcurl4-openssl-dev \
    libssl-dev

# Install extension PHP
RUN docker-php-ext-install \
    mysql \
    mysqli \
    pdo \
    pdo_mysql \
    gd \
    soap \
    gettext \
    calendar \
    mcrypt \
    dom \
    fileinfo \
    xml

# Tambah config upload besar
RUN echo "upload_max_filesize=128M" >> /usr/local/etc/php/php.ini && \
    echo "post_max_size=128M" >> /usr/local/etc/php/php.ini && \
    echo "max_execution_time=120" >> /usr/local/etc/php/php.ini && \
    echo "allow_url_fopen=On" >> /usr/local/etc/php/php.ini && \
    echo "date.timezone = Asia/Jakarta" >> /usr/local/etc/php/php.ini

# Debug: Cek module aktif
RUN php -m

# Download Xibo 1.6.4
RUN curl -L -o /tmp/xibo.zip https://launchpadlibrarian.net/186643925/xibo-server-164.zip && \
    unzip /tmp/xibo.zip -d /var/www/html && \
    rm /tmp/xibo.zip && \
    cd /var/www/html/xibo-server-164 && \
    cp -r . /var/www/html && \
    rm -rf /var/www/html/xibo-server-164

# Create Library Folder
RUN mkdir -p /var/www/xibo-library

# Fix permission
RUN chown -R www-data:www-data /var/www/html
RUN chown -R www-data:www-data /var/www/xibo-library


EXPOSE 80
