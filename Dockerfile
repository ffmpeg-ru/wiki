FROM squidfunk/mkdocs-material:7.1.1 as build
WORKDIR /build
COPY ./ /build/

RUN set -xe  \
    && mkdocs build

FROM nginx:1.19-alpine
COPY ./nginx_default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /build/site /var/www/html
LABEL io.yucca.ffmpeg=true

EXPOSE 8080
