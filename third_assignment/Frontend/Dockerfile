from nginx:latest

EXPOSE 80

COPY ./nginx.conf /etc/nginx/
COPY ./fix-nginx-conf.sh /etc/nginx/

VOLUME ["/hypervisor_etc"]
RUN ["chmod", "+x", "/etc/nginx/fix-nginx-conf.sh"]
ENV CC_BACKEND_SERVERS 192.168.0.3 192.168.0.4

CMD ["/bin/bash" , "-c" , "/etc/nginx/fix-nginx-conf.sh \"$CC_BACKEND_SERVERS\" && nginx"]
