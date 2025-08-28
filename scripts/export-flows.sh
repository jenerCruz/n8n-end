#!/bin/bash
set -e

# Ruta donde n8n guarda los flujos
N8N_DATA_DIR="/home/node/.n8n"

# 1. Sube los flujos a Supabase (si está configurado)
if [ -n "$SUPABASE_URL" ] && [ -n "$SUPABASE_SERVICE_KEY" ] && [ -n "$SUPABASE_BUCKET" ]; then
  /scripts/supabase-flows.sh upload
fi

# 2. Copia los flujos al repositorio Git y hace push
if [ -n "$GIT_REPO_URL" ]; then
  cp -r "$N8N_DATA_DIR/" "$N8N_DATA_DIR/flows-repo/flows/"
  cd "$N8N_DATA_DIR/flows-repo"
  git add .
  git commit -m "Exportando flujos de n8n"
  git push
fi

echo "Flujos exportados a Supabase y/o Git."
