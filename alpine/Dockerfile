FROM invoiceninja/invoiceninja:5.1
USER root

COPY 5/rootfs /

RUN apk update && \
    apk add nginx && \
    mkdir -p /run/nginx /var/www/app/public /var/www/app/public/storage/backups && \
    chown -R www-data:www-data /var/lib/nginx/tmp /var/lib/nginx /var/www/app/

EXPOSE 80

CMD ["/usr/local/bin/pre-init.sh", "supervisord"]
