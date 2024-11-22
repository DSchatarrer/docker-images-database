-- Crear la extensión dblink en la base de datos postgres
\c postgres
CREATE EXTENSION IF NOT EXISTS dblink;

-- Crear la base de datos server_dev si no existe usando dblink
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'dev') THEN
        PERFORM dblink_exec('dbname=postgres', 'CREATE DATABASE dev');
    END IF;
END
$$;

-- Conectar a la base de datos server_dev y crear la extensión vector si no existe
\c dev
CREATE EXTENSION IF NOT EXISTS vector;

