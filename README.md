# Container with apache httpd and php (7.4, 8.0) with kafka (librdkafka) support

Different versions of PHP present in separate branches.
The `master` branch will contain teh last version, 8.0 for now.

Container is based on [pimcore/pimcore](https://hub.docker.com/r/pimcore/pimcore)

## Automated builds!
![container build status](https://quay.io/repository/hubbitus/php-apache-kafka/status)

Containers for this repository builds automatically! Please pull the latest version from the repository: https://quay.io/repository/hubbitus/php-apache-kafka

For example:
```shell
podman run quay.io/hubbitus/php-apache-kafka
```

## Compose file example
See more realistic example in [docker-compose.yml](docker-compose.yml) file.

You may run it with:
```shell
podman-compose up -d
```
