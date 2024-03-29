# Docker-Container für die xt:Commerce Entwicklung
>Ein Packet für die xt Entwicklung passend für Hetzner

>Wer schnell in die Entwicklung von xt:Commerce 6.5 einsteigen will, kann dies in einem Docker-Container tun.  Dies ist keine von xt:Commerce Supportete Version!
>Da sich die Lizensbedingungen geändert haben brauch man natürlich ein Lizensfile im Ordner /lic

## Im Docker-Container enthalten

* Basis Linux Debian
* Apache
* PHP 8.1.17
* cURL
* Zlib
* GDlib
* SOAP
* SimpleXML
* MySQL 5.7
* phpMyAdmin
* NGINX als Proxy
* xt:Commerce Install shell Skript

### Benötigten Grundeinstellung für xt:Commerce 6 Demo
>Schon eingestellt in den Konfiguration


>PHP Konfiguration der Module in der php.ini
>* session_autostart = Off
>* file_uploads = on
>* xdebug.remote_enable = 1
>* allow_url_include = 1
>* memory_limit = 1024M
>* post_max_size = 100M
>* upload_max_filesize = 20M
>* max_execution_time = 1200
>
>Apache Konfiguration der Module in der vhosts default.conf
>* Options FollowSymlinks
>* RewriteEngine On
>
>MySQL Konfiguration in mycustom.cnf
>* character-set-server = utf8
>* collation-server = utf8_unicode_ci
>* skip-character-set-client-handshake

### Installation

Klone dieses Repository auf deinen Lokalen Computer mit dem Terminal und nutze danach die option`docker-compose up -d` um den Container zu Starten.

Im Terminal ausführen

```sh
$ https://github.com/rogergerecke/docker-xtcommerce6-server.git
$ cd docker-xtcommerce6-server/
$ git fetch --all
$ git checkout 8.1.17
$ docker-compose up -d

# Download and Install xt:Commerce files
$ ./install_xtcommerce.sh

# Set Folder default Permission
$ sudo ./set_folder_premission.sh
```

Der LAMP Server ist startklar! Du kannst im Browser erreichen unter `http://localhost`.

- Shop installation unter [http://localhost](http://localhost) erreichbar
- phpMyAdmin unter [http://localhost:8080](http://localhost:8080) erreichbar

#### Datenbankverbindung
- Datenbankhost: mysql
- Datenbankname: xtc
- Datenbanknutzer: xtc
- Datenbankpassword: xtc


#### Ordnerstruktur

```
/bin
## enthält nur die Dockerfiles zur Installation des Docker-Containers diese barauchen wir nicht anrühren.

/config
## enthält die config Datein für PHP,MYSQL,VHOST wenn man will kann man dort z.b. andere einstellung in der php.ini vornehmen.

/data
## enthält die gemounteten Datenbank Datein hier brauchen wir eigentlich auch nichts machen

/logs
## enhält die Logdatein diese sind für uns in der Entwiklung interessant hast du Fehler oder Problem schaue hier in den Logfiles nach.

/sql
## enthält die sql demo daten für den shop

/tests
## hier kommen die PHPunit tests hinein

/www
## enthält am ende die Installation das xt:Commerce Shop System dort verbringen wir wohl die meiste Zeit
```
##### Mit PHPStorm Programieren

Ich liebe PHPStorm als Entwiklungs-Umgebung sie ist günstig und bietet einfach alles was man braucht

##### Hilfe
Bei fehlern oder für verbesserung hier ein [Issue](https://github.com/rogergerecke/docker-xtcommerce6-server/issues) eröffnen

Docker Help
---


Update the php version in an existing docker-container change the PHP version in the Dockerfile
and run the both commands.

````
 docker-compose build --no-cache --pull YOUR_CONTAINER_NAME
 docker-compose up -d
````

###### Future

- [x] Update to PHP 8.1.17
- [x] Update to xt:Commerce 6.5.3
- [ ] Add .sh for Template editing



