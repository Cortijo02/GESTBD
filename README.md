## 1. Descargar el repositorio

 ```
git clone https://github.com/Cortijo02/GESTBD.git
 ```

## 2. Levantar contenedores

```
docker compose up postgres pgadmin elasticsearch graphdb jupyter
 ```
También se puede levantar el contenedor jupyter_llm para revisar el procesamiento de los campos *descripcion* y *salidas*.

## 3. Acceder a los servicos

 En la siguiente tabla se detallan los puertos y accesos de los servicios:

| Servicio        | Puerto local | URL de acceso                      | Descripción                                |
|-----------------|---------------|------------------------------------|--------------------------------------------|
| 🧭 **PgAdmin**  | `8082`        | [http://localhost:8082](http://localhost:8082) | Interfaz web para gestionar Postgres      |
| 🔍 **Elasticsearch** | `8000`   | [http://localhost:8000](http://localhost:8000) | Motor de búsqueda y análisis de texto     |
| 🕸️ **GraphDB**  | `8001`        | [http://localhost:8001](http://localhost:8001) | Base de datos de grafos RDF/SPARQL        |
| 📓 **Jupyter**  | `8002`        | [http://localhost:8002](http://localhost:8002) | Entorno interactivo para notebooks Python |
| 📓 **Jupyter LLMs**  | `8003`        | [http://localhost:8003](http://localhost:8003) | Entorno trabajar con jupyters, CUDA y LLMs (Ollama) |

En el contenedor de jupyter "queries.ipynb" contiene las queries a los servicios de Postgres, ElasticSearch y GraphDB.
