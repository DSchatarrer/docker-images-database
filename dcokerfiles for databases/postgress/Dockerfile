# pull official base image
FROM postgres:16

# Install dependencies for building extensions
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    libpq-dev \
    postgresql-server-dev-16  # Este paquete incluye postgres.h y otros necesarios

# Clone pgvector repo y compilar la extensión
RUN cd /tmp && \
    git clone --branch v0.7.4 https://github.com/pgvector/pgvector.git && \
    cd pgvector && \
    make && \
    make install

# run create.sql on init
ADD create.sql /docker-entrypoint-initdb.d


