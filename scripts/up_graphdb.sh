#!/bin/bash
echo "🚀 Levantando servicio GraphDB..."
docker compose up -d --build graphdb

echo "   🕸️ GraphDB → http://localhost:8001"
