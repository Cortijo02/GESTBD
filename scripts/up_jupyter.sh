#!/bin/bash
echo "🚀 Levantando servicio Jupyter..."
docker compose up -d --build jupyter

echo "   📓 Jupyter → http://localhost:8002"