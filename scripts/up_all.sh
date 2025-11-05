#!/bin/bash
echo "🚀 Levantando TODO el entorno GESTBD..."
docker compose up -d --build
echo "✅ Todos los servicios están en marcha:"

echo "   🧭 PgAdmin → http://localhost:8082"
echo "   🔍 Elasticsearch → http://localhost:8000"
echo "   🕸️ GraphDB → http://localhost:8001"
echo "   📓 Jupyter → http://localhost:8002"