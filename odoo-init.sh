#!/bin/bash
set -e

echo "################"
echo "Setting up odoo"
echo "################"

ADDONS_DIRECTORY=/mnt/extra-addons

# comma-separated list of folder names in /mnt/extra-addons
CUSTOM_ADDONS=`ls -dm $ADDONS_DIRECTORY/* | tr -d ' ' | sed 's/\/mnt\/extra-addons\///g'`
echo "Installing custom addons: $CUSTOM_ADDONS"

# comma-separated list of enterprise addons to install
ENTERPRISE_ADDONS=""
echo "Installing enterprise addons: $ENTERPRISE_ADDONS"

# if ENTERPRISE_ADDONS are selected for install, add them with a comma to the beginning
if [ "$ENTERPRISE_ADDONS" != "" ]; then
    ENTERPRISE_ADDONS=",$ENTERPRISE_ADDONS"
fi

PROJECT_ADDONS="${CUSTOM_ADDONS}${ENTERPRISE_ADDONS}"
echo "Installing addons: $PROJECT_ADDONS"

if [ "$PROJECT_ADDONS" != "" ]; then
    echo "###########################"
    echo "Installing custom addons"
    echo "###########################"

     # USE "-d ${DATABASE_NAME}" IF YOU WANT TO USE A SPECIFIC DATABASE
    odoo -d ${DATABASE_NAME} \
        -r ${POSTGRES_USER} \
        -w ${POSTGRES_PASSWORD} \
        --db_host=${HOST} \
        --db_port=${PORT} \
        --log-level=debug \
        --init $PROJECT_ADDONS \
        --update $PROJECT_ADDONS \
        --dev=all \
        --without-demo=all
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
fi