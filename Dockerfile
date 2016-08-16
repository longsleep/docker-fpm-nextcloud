FROM phusion/baseimage:0.9.19

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install php-fpm.
RUN export DEBIAN_FRONTEND=noninteractive; \
	apt-get update && \
	apt-get install -y php7.0-fpm php7.0-gd php7.0-mysql php7.0-curl \
		php7.0-xml php7.0-zip php7.0-intl php7.0-mcrypt \
		php7.0-mbstring php7.0-cli php7.0-sqlite

RUN sed -i "s/^listen = .*/listen = 9000/g" /etc/php/7.0/fpm/pool.d/www.conf
RUN sed -i "s/^;env\[PATH\] = .*/env\[PATH\] = \/usr\/local\/bin:\/usr\/bin:\/bin/g" /etc/php/7.0/fpm/pool.d/www.conf
RUN sed -i "s/^pid = .*/;pid =/g" /etc/php/7.0/fpm/php-fpm.conf

RUN mkdir /etc/service/php-fpm
ADD php-fpm.sh /etc/service/php-fpm/run

# Debug.
RUN rm -f /etc/service/sshd/down
RUN /usr/sbin/enable_insecure_key

# Folder for volumes.
RUN mkdir /srv/www

EXPOSE 9000
VOLUME = /srv/www

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
