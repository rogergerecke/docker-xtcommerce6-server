#!/usr/bin/env bash

#   Set the file name
#   xt:commerce
#   from the download link


DATEINAME="xtCommerce_6.5.3-2023-03-07"

# download xt:commerce from url
if curl -o $DATEINAME.zip -SL https://xtc6.s3-eu-west-1.amazonaws.com/$DATEINAME.zip
then
echo "Der Download von $DATEINAME.zip war erfolgreich"
fi

# entpacke xt:commerce in den www ordner und lösche die zip datei
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
