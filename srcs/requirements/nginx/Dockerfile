FROM alpine:3.14

RUN apk add --no-cache \
    nginx

RUN rm /etc/nginx/http.d/default.conf
COPY ./conf/wp-nginx.conf /etc/nginx/http.d/

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80

CMD nginx
