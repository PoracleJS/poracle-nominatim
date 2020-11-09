
useradd -m -p password1234 nominatim && \
chown -R nominatim:nominatim ./src && \
sudo -u nominatim ./src/build/utils/setup.php --osm-file /data/data.osm.pbf --all --threads $NOMINATIM_IMPORT_THREADS && \
sudo -u nominatim ./src/build/utils/check_import_finished.php 