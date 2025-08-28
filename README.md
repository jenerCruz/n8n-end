# gen8n

Contenedor n8n listo para Fly.io con persistencia externa en Supabase y Git

## Estructura

```
gen8n/
├── Dockerfile
├── README.md
├── fly.toml
├── scripts/
│   ├── entrypoint.sh
│   ├── export-flows.sh
│   ├── import-flows.sh
│   ├── supabase-flows.sh
│   ├── flows-repo/
│   └── flows/
└── .gitignore
```

## Variables de entorno necesarias

- `GIT_REPO_URL`: URL del repositorio Git para los flujos
- `SUPABASE_URL`: URL del proyecto Supabase
- `SUPABASE_SERVICE_KEY`: Clave de servicio de Supabase
- `SUPABASE_BUCKET`: Nombre del bucket en Supabase Storage

## Uso rápido

1. Configura las variables de entorno en Fly.io o tu plataforma.
2. Construye y despliega la imagen Docker.
3. Los flujos se sincronizan automáticamente con Git y Supabase.

## Scripts

- `import-flows.sh`: Importa flujos desde Supabase y/o Git.
- `export-flows.sh`: Exporta flujos a Supabase y/o Git.
- `supabase-flows.sh`: Sube/baja flujos a Supabase Storage.
- `entrypoint.sh`: Orquesta la importación/exportación y el arranque de n8n.

---

Cualquier duda, revisa los scripts o abre un issue.