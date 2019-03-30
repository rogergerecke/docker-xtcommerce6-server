#!/usr/bin/env bash

#   set filename der
#   xtcommerce datei
#   im donload link

DATEINAME="xtCommerce_6.1.1-2019-03-27"

# download xtcommerce from url
if curl -o $DATEINAME.zip -SL https://s3-eu-west-1.amazonaws.com/xtc6/$DATEINAME.zip
then
echo "Der Download von $DATEINAME.zip war erfolgreich"
fi

# entpacke xtcommerce in den www ordner und lösche die zip datei
if unzip -o $DATEINAME.zip -d www && rm $DATEINAME.zip
 then
 echo $DATEINAME.zip wurde nach www/$DATEINAME entpackt die Datein werden jetzt nach www verschoben...
 fi

# alle datein aus unterordner in www kopieren
if mv -f www/$DATEINAME/* www/ && cp -f www/$DATEINAME/.htaccess www/
 then
 echo -e "Alle Datein wurden nach www verschoben der Shop ist jetzt ueber http://localhost/ erreichbar. \n\n"
 echo -e "Wenn Sie hilfe benötigen wechseln Sie auf http://localhost/demo/"
 fi

# lehres verzeichnis löschen
if rm -r www/$DATEINAME
then
echo "Das Temporere Verzeichnis wurde gelöscht!  Führen Sie jetzt noch sudo ./set_folder_premission.sh im Terminal aus"
fi