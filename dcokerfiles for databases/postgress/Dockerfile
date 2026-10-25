
FROM postgres:16

ARG PGVECTOR_VERSION=v0.7.4

# Forzar pg_config de PostgreSQL 16
ENV PG_CONFIG=/usr/lib/postgresql/16/bin/pg_config

# Instalar dependencias
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        git \
        ca-certificates \
        libpq-dev \
        postgresql-server-dev-16 \
        postgresql-16-cron \
        postgresql-contrib && \
    update-ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Compilar pgvector 0.7.4 para PostgreSQL 16
RUN git clone \
        --depth 1 \
        --branch ${PGVECTOR_VERSION} \
        https://github.com/pgvector/pgvector.git \
        /tmp/pgvector && \
    cd /tmp/pgvector && \
    ${PG_CONFIG} --version && \
    make clean PG_CONFIG=${PG_CONFIG} && \
    make PG_CONFIG=${PG_CONFIG} && \
    make install PG_CONFIG=${PG_CONFIG} && \
    rm -rf /tmp/pgvector

COPY create.sql /docker-entrypoint-initdb.d/
