FROM jupyter/scipy-notebook:python-3.8

WORKDIR /home/gestbd
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]
