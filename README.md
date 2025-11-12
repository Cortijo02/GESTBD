## 1. Descargar el repositorio

 ```
git clone https://github.com/Cortijo02/GESTBD.git
 ```

## 2. Levantar contenedores

```
docker compose up postgres pgadmin elasticsearch graphdb jupyter
 ```

> También se puede levantar el contenedor jupyter_llm para revisar el procesamiento de los campos *descripcion* y *salidas* con llama3.1:8b.

En la carpeta `scripts` hemos dejado una serie de `.sh` que permiten lanzar los contenedores con diferentes configuraciones.

## 3. Acceder a los servicos

 En la siguiente tabla se detallan los puertos y accesos de los servicios:

| Servicio        | Puerto local | URL de acceso                      | Descripción                                |
|-----------------|---------------|------------------------------------|--------------------------------------------|
| 🧭 **PgAdmin**  | `8082`        | [http://localhost:8082](http://localhost:8082) | Interfaz web para gestionar Postgres      |
| 🔍 **Elasticsearch** | `8000`   | [http://localhost:8000](http://localhost:8000) | Motor de búsqueda y análisis de texto     |
| 🕸️ **GraphDB**  | `8001`        | [http://localhost:8001](http://localhost:8001) | Base de datos de grafos RDF/SPARQL        |
| 📓 **Jupyter**  | `8002`        | [http://localhost:8002](http://localhost:8002) | Entorno interactivo para notebooks Python |
| 📓 **Jupyter LLMs**  | `8003`        | [http://localhost:8003](http://localhost:8003) | Entorno trabajar con jupyters, CUDA y LLMs (Ollama) |

Y a continuación las credenciales de la base de datos:

| CAMPO               | VALOR                   |
|---------------------|-------------------------|
| email               | cinco@GESTDB.com        |
| password            | cinco                   |
| name                | postgres_db             |
| host name/address   | postgres                |
| port                | 5432                    |
| username_db         | userGESTDB              |
| password_db         | passGESTDB              |

En el contenedor de jupyter "queries.ipynb" contiene las queries a los servicios de Postgres, ElasticSearch y GraphDB.

## Sobre el trabajo

### Pasos seguidos

1. Web scraping: utilizamos los datos abiertos de la página de grados de la Comunidad de Madrid, que habilita PDFs con las descripciones, salidas y centros de los grados. Desde la página web base, hicimos web scraping pasa sacar las URLs de los PDFs, junto con las ramas y áreas de las webs intermedias donde estaban ordenadas. De los PDFs sacamos la información relevante (jupyter > src > scraping > pdfs_automatizado.ipynb) y procesamos los datos (jupyter > src > scraping > generar_csvs.ipynb; jupyter > src > scraping > extraccion_centros.ipynb; jupyter > src > scraping > extraccion_notascorte.ipynb) para obtener los CSVs.

2. Postgres

# TODO

4. ElasticSearch

# TODO

6. GraphDB: Para realizar esto diseñamos la ontología estableciendo las tripletas (y los prefijos utilizados de ontologías existentes). A través de un script the python (jupyter > src > graph > generador_grafo.ipynb), pasamos de los datos de PostGres a la ontología establecida y el resultado (se genera en esa misma carpeta con nombre universidadesMadrid.ttl)lo copiamos en (graphdb > imports). Una vez tenemos los archivos de la carpeta 'graphdb > imports' lanzamos el contenedor de GraphDB, generamos un repositorio 'Practica_GESTDB' e importamos ambos archivos (que se encuentrar en 'server files' porque los cargamos al montar el contenedor) con base iri 'http://example.org/universidadesMadrid#'. Una vez se realiza esto ya podemos lanzar las queries contra este sistema.

8. Cuaderno de consultas (jupyter > src > queries > queries.ipynb)

# TODO

### Futuros pasos y aspectos a mejorar

Una idea que superaba el scope de nuestro trabajo, pero que podría ser de interés consistiría en añadir una tabla con alumnos, datos personales y su carrera, e implementar un sistema de recomendación en base a gustos u otros datos para ayudar a un determinado alumno a elegir un grado universitario. 

Uno de los retos de este proyecto ha sido la obtención de datos desde los PDFs de la Comunidad de Madrid, que al tener múltiples formatos hacía complicado en muchos casos aplicar reglas que favoreciesen la generalización y obtuviesen toda la información bien. Por ello, un aspecto a mejorar sería mejorar el procesamiento de los datos inciales y asegurar que estos tuviesen formatos similares en los CSVs resultantes.


### Aspectos legales

Los datos utilizados en este proyecto son utilizados con fines académicos, han sido extraídos de la página web de la Comunidad de Madrid el día 6 de noviembre de 2025.