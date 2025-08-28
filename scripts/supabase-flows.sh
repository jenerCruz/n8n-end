#!/bin/bash
# Script para subir y bajar flujos de n8n a Supabase
# Requiere: SUPABASE_URL, SUPABASE_SERVICE_KEY, SUPABASE_BUCKET, N8N_DATA_DIR

set -e

# Instala supabase CLI si no está presente
if ! command -v supabase &> /dev/null; then
  npm install -g supabase
fi

# Función para subir flujos a Supabase
upload_flows() {
  supabase storage cp "$N8N_DATA_DIR/flows/" "storage://$SUPABASE_BUCKET/flows/" --project-ref "$SUPABASE_URL" --service-key "$SUPABASE_SERVICE_KEY" --recursive
}

# Función para descargar flujos de Supabase
import_flows() {
  supabase storage cp "storage://$SUPABASE_BUCKET/flows/" "$N8N_DATA_DIR/flows/" --project-ref "$SUPABASE_URL" --service-key "$SUPABASE_SERVICE_KEY" --recursive
}

case "$1" in
  upload)
    upload_flows
    ;;
  import)
    import_flows
    ;;
  *)
    echo "Uso: $0 [upload|import]"
    exit 1
    ;;
esac
