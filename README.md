# Docker Container zur xt:Commerce entwicklung


Dies ist die Basis-Entwiklungsumgebung für xt:Commerce 6 Free es handelt sich hierbei nicht um eine offiziele Version.  Es soll interessierten Entwiklern helfen schnell los legen zu können.

* PHP
* Apache
* MySQL
* phpMyAdmin
* xt:Commerce Install

Basierend auf den benötigten Grundeinstellung mit PHP und Modulen
* [7.3.x](https://github.com/rogergerecke/xtcommerce6-docker-container.git)

## Installation

Klone dieses Repository auf deinen Lokalen Computer und nutze die option`docker-compose up -d`.

Im Terminal ausführen
```shell
git clone https://github.com/rogergerecke/xtcommerce6-docker-container.git
cd docker-compose-lamp/
git fetch --all
git checkout 7.1.x
docker-compose up -d

./install_xtcommerce.sh
```

Der LAMP Server ist startklar!! Du kannst im Browser erreichen unter `http://localhost`.

## Ordnerstrucktur

```
/bin
## enthält nur die Dockerfiles zur Installation des Docker-Containers diese barauchen wir nicht anrühren.

/config
## enthält die config Datein für PHP,MYSQL,VHOST wenn man will kann man dort z.b. andere einstellung in der php.ini vornehmen.



```
## Installation mit PHPStorm das beste zusammenspiel
