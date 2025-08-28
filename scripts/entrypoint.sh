#!/bin/bash
set -e

# Variables de entorno necesarias:
# GIT_REPO_URL: URL del repositorio Git de flujos

/scripts/import-flows.sh

# Inicia n8n en segundo plano
n8n &
N8N_PID=$!

# Espera a que n8n termine (por ejemplo, al recibir SIGTERM)
trap '/scripts/export-flows.sh; kill $N8N_PID' SIGTERM SIGINT
wait $N8N_PID
