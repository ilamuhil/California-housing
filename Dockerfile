FROM continuumio/miniconda3

WORKDIR /app

COPY . /app

COPY environment.yml .

RUN conda env create -f environment.yml

SHELL ["conda","run","-n","myenv","/bin/bash","-c"]

EXPOSE 80

CMD ["conda", "run", "-n", "myenv", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]