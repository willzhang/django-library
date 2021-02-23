FROM python:3.9-slim-buster

ENV PYTHONUNBUFFERED 1

RUN apt-get update \
    && apt-get install -y --no-install-recommends python3-dev default-libmysqlclient-dev gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code/

COPY library/ ./

RUN pip install --no-cache-dir -r requirements.txt

VOLUME /code/
EXPOSE 8000

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
