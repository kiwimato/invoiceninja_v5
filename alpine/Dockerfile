FROM invoiceninja/invoiceninja:5.1
USER root
RUN apk update && \
    apk add nginx

COPY 5/rootfs/etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY 5/rootfs/etc/supervisord.conf /etc/supervisord.conf
COPY 5/rootfs/docker-entrypoint-init.d/20-chown.sh /docker-entrypoint-init.d/20-chown.sh
COPY 5/rootfs/usr/local/bin/pre-init.sh /usr/local/bin/pre-init.sh
COPY 5/rootfs/usr/local/bin/docker-entrypoint /usr/local/bin/docker-entrypoint
COPY 5/rootfs/usr/local/bin/genssl.sh /usr/local/bin/genssl.sh

RUN mkdir -p /run/nginx \
 && chown -R www-data:www-data /var/lib/nginx/tmp /var/lib/nginx /var/www/app/

EXPOSE 80

CMD ["/usr/local/bin/pre-init.sh", "supervisord"]
