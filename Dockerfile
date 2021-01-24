# For now. There may be wheels and whatnot that MUSL won't work with
FROM python:3.9.1-slim-buster

RUN pip install jupyterlab --no-cache-dir --no-input install jupyterlab
EXPOSE 10000/TCP

CMD [ \
 "jupyter", "lab", "--allow-root",  "--ip", "0.0.0.0", "--port", "10000", \
 "--NotebookApp.allow_origin", "*", "--NotebookApp.token", "", "--NotebookApp.password", "" \
 "--no-browser" \
]
