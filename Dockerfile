# Use Ubuntu 14.04 as the base image
FROM ubuntu:14.04

# Set environment variable
ENV MAGIC_ENVIRONMENT local

# Update package lists
RUN apt-get update \
    && apt-get install -y software-properties-common

# Install rsyslog
RUN apt-get install -y rsyslog

# Add tools to help to Debug
RUN apt-get install -y multitail 

# Install Apache and PHP 5.5
RUN apt-get install -y apache2 \
    && apt-get install -y php5 \
    && apt-get install -y libapache2-mod-php5 \
    && apt-get install -y php5-mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Enable PHP error reporting and short tags
RUN sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini \
    && sed -i 's/display_startup_errors = Off/display_startup_errors = On/' /etc/php5/apache2/php.ini \
    && sed -i 's/log_errors = Off/log_errors = On/' /etc/php5/apache2/php.ini \
    && sed -i 's/error_reporting = .*/error_reporting = E_ALL/' /etc/php5/apache2/php.ini \
    && sed -i 's/;error_log = php_errors.log/error_log = syslog/' /etc/php5/apache2/php.ini \
    && sed -i 's/short_open_tag = Off/short_open_tag = On/' /etc/php5/apache2/php.ini

COPY custom-apache.conf /etc/apache2/conf-available/

RUN a2enconf custom-apache

RUN a2enconf custom-apache

#RUN rm -f /var/www/html/index.html

# Copy your application source to the appropriate directory
COPY ./www /var/www/html

# Expose port 80
EXPOSE 80

# Custom script to start both Apache and rsyslog
COPY start_services.sh /start_services.sh
RUN chmod +x /start_services.sh
CMD ["/start_services.sh"]
