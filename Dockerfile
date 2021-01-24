# For now. There may be wheels and whatnot that MUSL won't work with
FROM python:3.9.1-slim-buster

RUN mkdir -p /data/notebooks
RUN mkdir -p /data/datasets
RUN mkdir -p /data/config
RUN mkdir -p /data/runtime

RUN groupadd -r -g 1000 jupyter
RUN useradd -r -m -d /data -g jupyter jupyter -u 1000 -s /bin/bash 
RUN chown jupyter:jupyter /data/notebooks
RUN chown jupyter:jupyter /data/datasets
RUN chown jupyter:jupyter /data/config
RUN chown jupyter:jupyter /data/runtime


RUN apt update && apt upgrade -y
RUN apt install -y vim curl git build-essential gdb

RUN pip install jupyterlab --no-cache-dir --no-input install jupyterlab ipython ipdb pudb

ENV JUPYTER_TOKEN=""
ENV JUPYTER_PASSWD=""
ENV JUPYTER_IP="0.0.0.0"
ENV JUPYTER_PORT=10000
ENV NOTEBOOK_ROOT="/data/notebooks/"
ENV CONFIG_FILE="/data/config/jupyter_lab_config.py"

# This seems like a terrible idea
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

COPY launch.sh /opt/launch.sh

EXPOSE 10000/TCP

USER jupyter
ENTRYPOINT ["sh", "/opt/launch.sh"]
