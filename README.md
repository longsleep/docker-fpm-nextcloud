# Docker Nextcloud PHP-FPM container

A minimal Docker container, providing exposed PHP-FPM to simplify Nextcloud development.

## Build image

```bash
docker build -t docker-fpm-nextcloud .
```

## Run container

This repos is lacking some serious docs. Basic idea is to clone Nextcloud into `pwd`/nextcloud-server and run this Docker container on top of it via volume mount. It exposes PHP-FPM on port 9000/tcp which then can be used as normal with a frontent webserver as fastcgi proxy.

```bash
docker run --rm --name my-nextcloud-dev -p 9000:9000 -v `pwd`/nextcloud-server:/srv/www -i -t docker-fpm-nextcloud
```

## Permissions

Nextcloud needs write permissions to certain folders. When using the volume
mount this can be easily archived with the following insecure commands.

```bash
chmod -R 777 nextcloud-server/config/
chmod -R 777 nextcloud-server/data/
```

This makes stuff world writable - do not use on production machines!
