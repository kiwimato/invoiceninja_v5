FROM invoiceninja/invoiceninja:5.1
USER root

COPY 5/rootfs /

RUN apk update && \
    apk add nginx && \
    mkdir -p /run/nginx && \
    chown -R www-data:www-data /var/lib/nginx/tmp /var/lib/nginx /var/www/app/

EXPOSE 80

CMD ["/usr/local/bin/pre-init.sh", "supervisord"]
