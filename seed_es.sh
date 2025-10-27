#!/bin/bash

ES_URL="http://localhost:9200"

echo "Creando índice 'clientes'..."
curl -s -X PUT "$ES_URL/clientes" \
  -H "Content-Type: application/json" \
  -d '{
    "settings": {
      "number_of_shards": 1,
      "number_of_replicas": 0
    },
    "mappings": {
      "properties": {
        "nombre":         { "type": "text" },
        "email":          { "type": "keyword" },
        "telefono":       { "type": "keyword" },
        "fecha_alta":     { "type": "date"    },
        "activo":         { "type": "boolean" },
        "total_compras":  { "type": "float"   },
        "etiquetas":      { "type": "keyword" }
      }
    }
  }' 
echo -e "\n"

echo "Insertando documentos en 'clientes'..."
curl -s -X POST "$ES_URL/clientes/_bulk" \
  -H "Content-Type: application/json" \
  --data-binary @- <<'EOF'
{ "index": { "_id": 1 } }
{ "nombre": "Laura Martín", "email": "laura.martin@example.com", "telefono": "+34 600111222", "fecha_alta": "2024-02-10", "activo": true, "total_compras": 1299.50, "etiquetas": ["premium","newsletter"] }
{ "index": { "_id": 2 } }
{ "nombre": "Javier Pérez", "email": "j.perez@example.com", "telefono": "+34 600333444", "fecha_alta": "2023-11-03", "activo": true, "total_compras": 230.00, "etiquetas": ["soporte"] }
{ "index": { "_id": 3 } }
{ "nombre": "Ana Gómez", "email": "ana.gomez@example.com", "telefono": "+34 600555666", "fecha_alta": "2022-07-21", "activo": false, "total_compras": 0.0, "etiquetas": ["baja"] }
{ "index": { "_id": 4 } }
{ "nombre": "Marcos Ortega", "email": "mortega@example.com", "telefono": "+34 600777888", "fecha_alta": "2024-12-01", "activo": true, "total_compras": 87.99, "etiquetas": ["newsletter"] }
{ "index": { "_id": 5 } }
{ "nombre": "Lucía Fernández", "email": "luciaf@example.com", "telefono": "+34 600999000", "fecha_alta": "2025-05-15", "activo": true, "total_compras": 542.10, "etiquetas": ["premium","soporte"] }
EOF
echo -e "\n"

echo "Creando índice 'logs_app'..."
curl -s -X PUT "$ES_URL/logs_app" \
  -H "Content-Type: application/json" \
  -d '{
    "settings": {
      "number_of_shards": 1,
      "number_of_replicas": 0
    },
    "mappings": {
      "properties": {
        "timestamp": { "type": "date" },
        "nivel":     { "type": "keyword" },
        "servicio":  { "type": "keyword" },
        "mensaje":   { "type": "text" },
        "usuario":   { "type": "keyword" }
      }
    }
  }'
echo -e "\n"

echo "Insertando documentos en 'logs_app'..."
curl -s -X POST "$ES_URL/logs_app/_bulk" \
  -H "Content-Type: application/json" \
  --data-binary @- <<'EOF'
{ "index": {} }
{ "timestamp": "2025-10-27T08:10:22Z", "nivel": "INFO",  "servicio": "auth-service", "mensaje": "Usuario j.perez login correcto", "usuario": "j.perez" }
{ "index": {} }
{ "timestamp": "2025-10-27T08:11:05Z", "nivel": "ERROR", "servicio": "orders-api",   "mensaje": "Timeout al consultar inventario", "usuario": "system" }
{ "index": {} }
{ "timestamp": "2025-10-27T08:12:47Z", "nivel": "WARN",  "servicio": "orders-api",   "mensaje": "Pedido 8457 con stock bajo (<3 uds)", "usuario": "system" }
{ "index": {} }
{ "timestamp": "2025-10-27T08:13:02Z", "nivel": "INFO",  "servicio": "billing",      "mensaje": "Cobro realizado 87.99€ a mortega@example.com", "usuario": "mortega@example.com" }
EOF
echo -e "\n"

echo "Listo."