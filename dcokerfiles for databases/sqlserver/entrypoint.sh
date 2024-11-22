#!/bin/bash

set -e

# Iniciar SQL Server en segundo plano
/opt/mssql/bin/sqlservr &

# Esperar hasta que SQL Server esté listo
echo "Esperando a que SQL Server esté listo..."
sleep 30s

# Ejecutar el archivo SQL para inicializar la base de datos y la tabla
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'Admin_123' -d master -i /usr/src/app/create.sql -C

# Mantener el contenedor en ejecución
wait $!


