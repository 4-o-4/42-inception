FROM alpine:3.14

RUN apk add --no-cache \
    nginx

EXPOSE 80

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

CMD nginx