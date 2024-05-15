# Laravel Docker

This repository creates base Docker images for use with [Laravel](https://laravel.com) on [Fly.io](https://fly.io). 

## PHP

This creates a base container for the following PHP versions

* 7.4
* 8.0
* 8.1
* 8.2
* 8.3

Built containers from this project will be available at https://hub.docker.com/r/fideloper/fly-laravel

## Building

You can build containers from this project using a command like so:

```bash
# From the project root:
PHP_VERSION="8.2"
docker build \
    -t myimage:$PHP_VERSION
    --build-arg PHP_VERSION=$PHP_VERSION \
    -f src/Dockerfile \
    ./src
```

## Configuration

The following environment variables can be set at run-time or when extending this container:

| env  | description                          | default value |
|------|--------------------------------------|---------------|
| PHP_PM_MAX_CHILDREN | php-fpm setting pm.max_children      | 10            |
| PHP_PM_START_SERVERS | php-fpm setting pm.start_servers     | 3             |
| PHP_MIN_SPARE_SERVERS | php-fpm setting pm.min_spare_servers | 2             |
| PHP_MAX_SPARE_SERVERS | php-fpm setting pm.max_spare_servers | 4             |
| PHP_DATE_TIMEZONE | php setting timezone                 | UTC           |
| PHP_DISPLAY_ERRORS | php setting display_errors           | Off           |
| PHP_ERROR_REPORTING | php setting error_reporting          | 22527         |
| PHP_MEMORY_LIMIT | php setting memory_limit             | 256M          |
| PHP_MAX_EXECUTION_TIME | php setting max_execution_time       | 90            |
| PHP_POST_MAX_SIZE | php setting post_max_size            | 100M          |
| PHP_UPLOAD_MAX_FILE_SIZE | php setting upload_max_file_size     | 100M          |
| PHP_ALLOW_URL_FOPEN | php setting allow_url_fopen     | 0          |
