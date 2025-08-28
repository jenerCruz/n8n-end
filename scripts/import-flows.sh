#!/bin/bash
set -e

# Ruta donde n8n guarda los flujos
N8N_DATA_DIR="/home/node/.n8n"

# 1. Descarga los flujos desde Supabase (si está configurado)
if [ -n "$SUPABASE_URL" ] && [ -n "$SUPABASE_SERVICE_KEY" ] && [ -n "$SUPABASE_BUCKET" ]; then
  /scripts/supabase-flows.sh import
fi

# 2. Clona o actualiza el repositorio de flujos desde Git
if [ -n "$GIT_REPO_URL" ]; then
  if [ ! -d "$N8N_DATA_DIR/flows-repo/.git" ]; then
    git clone "$GIT_REPO_URL" "$N8N_DATA_DIR/flows-repo"
  else
    cd "$N8N_DATA_DIR/flows-repo"
    git pull
  fi
  # Copia los flujos al directorio de n8n
  cp -r "$N8N_DATA_DIR/flows-repo/flows/." "$N8N_DATA_DIR/"
fi

echo "Flujos importados desde Supabase y/o Git."
