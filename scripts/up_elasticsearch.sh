#!/bin/bash
echo "🚀 Levantando servicio Elasticsearch..."
docker compose up -d --build elasticsearch

echo "   🔍 Elasticsearch → http://localhost:8000"