from nginx:latest

EXPOSE 80

COPY ./nginx.conf /etc/nginx/
COPY ./fix-nginx-conf.sh /etc/nginx/

VOLUME ["/hypervisor_etc"]
RUN ["chmod", "+x", "/etc/nginx/fix-nginx-conf.sh"]

CMD ["/bin/bash", "-c", "/etc/nginx/fix-nginx-conf.sh && nginx"]
