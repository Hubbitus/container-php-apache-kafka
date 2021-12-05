# Container with apache httpd and php (7.4, 8.0) with kafka (librdkafka) support

Different versions of PHP see in separate branches.
The `master` branch will contain teh last version, 8.0 for now.

Container is based on https://hub.docker.com/r/pimcore/pimcore

Containers for this repository builds automatically! Please pull it from the repository: https://quay.io/repository/hubbitus/php-apache-kafka
For example:

```shell
podman run quay.io/hubbitus/php-apache-kafka
```

## Compose file example
See more realistic example in [docker-compose.yml]() file.

You may run it with:
```shell
podman-compose up -d
```
