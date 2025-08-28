FROM n8nio/n8n:latest

# Instala git y utilidades necesarias
USER root
RUN apk update && apk add git openssh


# Copia los scripts personalizados
COPY scripts/import-flows.sh /scripts/import-flows.sh
COPY scripts/export-flows.sh /scripts/export-flows.sh
COPY scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /scripts/import-flows.sh /scripts/export-flows.sh /entrypoint.sh

# Usa el entrypoint personalizado
ENTRYPOINT ["/entrypoint.sh"]

USER node