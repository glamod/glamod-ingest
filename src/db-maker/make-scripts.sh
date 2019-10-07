#!/bin/bash

if [ ! ${SCHEMA_NAME} ]; then
    echo "[ERROR] No SCHEMA_NAME env var."
    exit
fi

if [ ! ${DB_USER} ]; then
    echo "[ERROR] No DB_USER env var."
    exit
fi

if [ ! ${WEB_USER} ]; then
    echo "[ERROR] No WEB_USER env var."
    exit
fi


for tmpl in *.sql.tmpl; do

    echo "[INFO] Working on: $tmpl"
    sql=$(echo $tmpl | sed 's/\.tmpl//;')
    rm -f $sql

    while read; do
        echo "$REPLY" | sed "s/SCHEMA_NAME/${SCHEMA_NAME}/g" | sed "s/DB_USER/${DB_USER}/g" | sed "s/WEB_USER/${WEB_USER}/g" >> $sql
    done < $tmpl

    echo "[INFO] Wrote: $sql"

done

