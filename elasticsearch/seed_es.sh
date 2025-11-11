#!/bin/bash
set -e

echo "⏳ Esperando a que Elasticsearch esté listo..."
until curl -s http://localhost:8000 >/dev/null 2>&1; do
  sleep 3
done
echo "✅ Elasticsearch está disponible, creando índice..."

INDEX_NAME="informacion_grados"

# Si existe, lo borramos
if curl -s -o /dev/null -w "%{http_code}" http://localhost:9200/$INDEX_NAME | grep -q "200"; then
  echo "🧹 Eliminando índice existente: $INDEX_NAME"
  curl -X DELETE "http://localhost:8000/$INDEX_NAME" >/dev/null 2>&1
fi

# Crear índice con el mapping
curl -X PUT "http://localhost:8000/$INDEX_NAME" \
  -H "Content-Type: application/json" \
  -d '{
    "mappings": {
      "properties": {
        "id": { "type": "integer" },
        "nombre": { "type": "text" },
        "id_area": { "type": "integer" },
        "descripcion": { "type": "text" },
        "descripcion_vector": {
          "type": "dense_vector",
          "dims": 384,
          "index": true,
          "similarity": "cosine"
        },
        "salidas": { "type": "text" },
        "salidas_vector": {
          "type": "dense_vector",
          "dims": 384,
          "index": true,
          "similarity": "cosine"
        }
      }
    }
  }'

echo "✅ Índice '$INDEX_NAME' creado correctamente."
