#!/bin/bash

# Quality of life


jupyter lab \
    --allow-root \
    --config="${CONFIG_FILE}" \
    --ip="${JUPYTER_IP}" \
    --port=${JUPYTER_PORT} \
    --ServerApp.allow_origin="*" \
    --ServerApp.token="${JUPYTER_TOKEN}" \
    --ServerApp.password="${JUPYTER_PASSWORD}" \
    --no-browser \
    --notebook-dir="${NOTEBOOK_ROOT}" \
    -y
