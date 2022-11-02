#!/bin/bash
set -e

echo "################"
echo "Setting up odoo"
echo "################"

odoo -d ${DATABASE_NAME} \
    -r ${POSTGRES_USER} \
    -w ${POSTGRES_PASSWORD} \
    --db_host=${HOST} \
    --db_port=${PORT} \
    --log-level=debug \
    --dev=all