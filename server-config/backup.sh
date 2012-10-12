#!/bin/sh

FILE="backup_$(date +%Y%m%d_%H%M%S)"

export PGPASSWORD="pg07sql08"

mysqldump portal -u root -pmy07sql08 > /backupdir/portal${FILE}.sql

pg_dump -h localhost -U nuxeopsql nuxeo  > /backupdir/nuxeo_db_${FILE}.sql

tar -zcf /backupdir/nuxeo_blob_${FILE}.tgz /opt/nuxeo/nxserver/data/binaries/*
