# Docker nextCloud PHP-FPM container

A minimal Docker container, providing exposed PHP-FPM to simplify nextCloud development.

## Build image

```bash
docker build -t docker-fpm-nextcloud .
```

## Run container

```bash
docker run --rm --name my-nextcloud-dev -p 9000:9000 -v `pwd`/nextcloud-server:/srv/www -i -t docker-fpm-nextcloud
```

