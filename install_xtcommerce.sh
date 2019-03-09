#!/usr/bin/env bash

#   set filename der
#   xtcommerce datei
#   im donload link

DATEINAME="xtCommerce_6.1.0-2019-03-05"

# download xtcommerce from url
if curl -o $DATEINAME.zip -SL https://s3-eu-west-1.amazonaws.com/xtc6/$DATEINAME.zip
then
echo "Der Download von $DATEINAME.zip war erfolgreich"
fi

# entpacke xtcommerce in den www ordner und lösche die zip datei
if unzip -o $DATEINAME.zip -d www && rm $DATEINAME.zip
 then
 echo $DATEINAME.zip wurde nach www/$DATEINAME entpackt
 fi

# alle datein aus unterordner in www kopieren
if mv -f www/$DATEINAME/* www/ && cp -f www/$DATEINAME/.htaccess www/
 then
 echo Alle Datein wurde in www entpackt
 fi

# lehres verzeichnis löschen
if rm -r www/$DATEINAME
then
echo Altes verzeichnis wurde gelöscht
fi
