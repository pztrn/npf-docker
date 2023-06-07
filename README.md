# nginx, php, fpm

This container provides ability to use nginx with php-fpm for any PHP application.

Container was created as an attempt to move everything inside Docker, even things that isn't really dockerized for some reason.

**Warning:** this image isn't small and contains everything that is available in Alpine Linux for php. If you want to minimize image size - please build application-specific container!

## Versions

At current commit image is using:

* Alpine 3.14.0
* nginx 1.22.1
* php 8.1.17

## Adding nginx configuration

Just bind files (or whole directory) to `/etc/nginx/conf.d`.

## Adding php-fpm configuration

Just bind files (or whole directory) to `/etc/php7/php-fpm.d` with valid php-fpm configuration. Example:

```ini
[your-app]
user = nginx
group = nginx

listen = 127.0.0.1:9000

listen.owner = nginx
listen.group = nginx

listen.allowed_clients = 127.0.0.1

pm = dynamic
pm.max_children = 40
pm.start_servers = 4
pm.min_spare_servers = 4
pm.max_spare_servers = 36
pm.process_idle_timeout = 10s;
pm.max_requests = 100

catch_workers_output = yes
access.log = /proc/self/fd/2

env[HOSTNAME] = $HOSTNAME
env[PATH] = /usr/local/bin:/usr/bin:/bin
env[TMP] = /tmp
env[TMPDIR] = /tmp
env[TEMP] = /tmp

php_admin_value[memory_limit] = 128M
```

Notable things:

* As nginx runs as user `nginx`, then php-fpm should also work using this user!
