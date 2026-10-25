-- Crear la extensión dblink en la base de datos postgres
\c postgres
CREATE EXTENSION IF NOT EXISTS dblink;

-- Crear la base de datos dev si no existe usando dblink
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'dev') THEN
        PERFORM dblink_exec('dbname=postgres', 'CREATE DATABASE dev');
    END IF;
END
$$;

-- Conectar a la base de datos dev y crear la extensión vector y pg_cron
\c dev
CREATE EXTENSION IF NOT EXISTS vector;
CREATE EXTENSION IF NOT EXISTS pg_cron;

-- Nuevas extensiones para búsqueda textual
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS unaccent;


-- (opcional) Crear tarea periódica
-- SELECT cron.schedule(
--   'limpiar_tokens_expirados',
--   '0 * * * *',
--   $$DELETE FROM tokens WHERE fecha_exp < now();$$
-- );
