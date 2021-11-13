FROM docker.io/pimcore/pimcore:PHP8.0-apache-debug

LABEL org.opencontainers.image.authors="Pahan@Hubbitus.info"

# Debian Buster provides librdkafka-dev only as version 0.8.5. This meant that we would have to build it ourselves.
# By https://medium.com/@jeromegamez/adding-kafka-support-to-php-on-docker-56a3881043c1
ENV LIBRDKAFKA_VERSION v1.7.0
ENV BUILD_DEPS \
	autoconf \
	build-essential \
	git \
	libsasl2-dev \
	libssl-dev \
	python-minimal \
	zlib1g-dev

RUN apt-get update \
	&& apt-get install -y --no-install-recommends ${BUILD_DEPS} \
	&& cd /tmp \
	&& git clone \
		--branch ${LIBRDKAFKA_VERSION} \
		--depth 1 \
		https://github.com/edenhill/librdkafka.git \
	&& cd librdkafka \
	&& ./configure \
	&& make \
	&& make install \
	&& pecl install rdkafka \
	&& docker-php-ext-enable rdkafka \
	&& rm -rf /tmp/librdkafka \
	&& apt-get purge -y -o APT::AutoRemove::RecommendsImportant=false \
		${BUILD_DEPS}

# "apt-get purge -y --auto-remove" with last flag will remove extra libraries like ZIP, imagick and so on... So you will get erros on "php -i"!
