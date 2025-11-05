#!/bin/bash
echo "🚀 Levantando servicios de base de datos: Postgres + PgAdmin..."
docker compose up --build postgres pgadmin

echo "   🧭 PgAdmin → http://localhost:8082"