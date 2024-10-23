# PHP8.2-fpmの公式イメージをベースにする
FROM php:8.2-fpm

RUN curl -LO https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php
RUN php datadog-setup.php --php-bin=all --enable-profiling --enable-appsec

# Composerをインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# CakePHPプロジェクトを作成するためにgitをインストール
RUN apt-get update && apt-get install -y git unzip libicu-dev && \
    docker-php-ext-install intl

# 作業ディレクトリを設定
WORKDIR /var/www/html

# CakePHPプロジェクトをインストール
RUN COMPOSER_ALLOW_SUPERUSER=1 composer create-project --prefer-dist cakephp/app:5.* cakephp5 && composer require vlucas/phpdotenv

COPY .env /var/www/html/cakephp5/.env
#COPY entrypoint.sh ./entrypoint.sh

# PHP-FPMのポート
EXPOSE 9000

# コンテナ起動時にPHP-FPMを開始
ENTRYPOINT ["/bin/bash"]
CMD ["-c", "sed -i 's/;clear_env = no/clear_env = no/' /usr/local/etc/php-fpm.d/www.conf; php-fpm"]
