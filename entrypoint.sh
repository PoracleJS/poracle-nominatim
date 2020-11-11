
# Make sure config file has right db 
sed -i "s/.*@define\('CONST_Database_DSN'.*/@define\('CONST_Database_DSN', 'pgsql:host=${NOMINATIM_DB_HOST};port=${NOMINATIM_DB_PORT};user=${NOMINATIM_DB_USER};password=${NOMINATIM_DB_PASSWORD};dbname=${NOMINATIM_DB_NAME}');/g" /app/src/build/settings/local.php

# sed -i "s/.*@define\('CONST_Replication_Url'.*/@define\('CONST_Replication_Url', '${NOMINATIM_REPLICATION_URL}' )" /app/src/build/settings/local.php


echo "Starting nominatim-docker container"
cat /app/src/build/settings/local.php

if [ $NOMINATIM_INIT ]
then
	curl -L $NOMINATIM_PBF_URL --create-dirs -o /data/data.osm.pbf
	sudo sh /app/init.sh
fi

sh /app/startapache.sh