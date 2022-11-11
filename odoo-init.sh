#!/bin/bash
set -e

echo "################"
echo "Setting up odoo"
echo "################"



if [ -z "$(ls -A $ADDONS_DIRECTORY)" ]; then
    echo "################"
    echo "Installing custom addons"
    echo "################"

    ADDONS_DIRECTORY=/mnt/extra-addons

    # comma-separated list of folder names in /mnt/extra-addons
    CUSTOM_ADDONS=`ls -dm $ADDONS_DIRECTORY/* | tr -d ' ' | sed 's/\/mnt\/extra-addons\///g'`
    echo "Installing custom addons: $CUSTOM_ADDONS"
    odoo -d ${DATABASE_NAME} \
        -r ${POSTGRES_USER} \
        -w ${POSTGRES_PASSWORD} \
        --db_host=${HOST} \
        --db_port=${PORT} \
        --log-level=debug \
        --init $CUSTOM_ADDONS \
        --update $CUSTOM_ADDONS \
        --dev=all \
        --stop-after-init
else
    echo "################"
    echo "No addons"
    echo "################"
    odoo -d ${DATABASE_NAME} \
        -r ${POSTGRES_USER} \
        -w ${POSTGRES_PASSWORD} \
        --db_host=${HOST} \
        --db_port=${PORT} \
        --log-level=debug \
        --dev=all
        --stop-after-init
fi