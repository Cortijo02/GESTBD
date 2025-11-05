FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN apt-get update && apt-get install -y \
    curl git wget python3 python3-pip python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://ollama.com/install.sh | sh

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

RUN useradd -ms /bin/bash gestbd
WORKDIR /home/gestbd

CMD ["bash", "-c", "ollama serve & sleep 5 && ollama pull llama3.1:8b && exec jupyter lab --ip=0.0.0.0 --port=8003 --allow-root --no-browser --NotebookApp.token='' --NotebookApp.password=''"]
