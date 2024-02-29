FROM python:3.8.16-slim-bullseye

ENV WORKERS_PER_CORE=4
ENV MAX_WORKERS=24
ENV LOG_LEVEL="warning"
ENV TIMEOUT="200"

RUN mkdir -p /home/app/duck
RUN addgroup --system app && adduser --system --group app

ENV HOME=/home/app/duck
WORKDIR $HOME

RUN pip install -U pip
RUN apt-get update
RUN apt-get install unzip postgresql-client -y
RUN apt-get clean

COPY ./data/duckdb_cli-linux-amd64.zip $HOME

RUN chown -R app:app $HOME
RUN unzip duckdb_cli-linux-amd64.zip

# USER app
# ENTRYPOINT ["/bin/bash", "/home/app/duck/entrypoint.sh"]
# ENTRYPOINT ["sh -c "]