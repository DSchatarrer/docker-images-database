# Pull official base image
FROM mcr.microsoft.com/mssql/server:2022-latest

# Cambiar al usuario root para tener permisos de administrador
USER root

# Copy SQL scripts
COPY create.sql /usr/src/app/

# Copy custom entrypoint script
COPY entrypoint.sh /usr/src/app/

# Make entrypoint script executable
RUN chmod +x /usr/src/app/entrypoint.sh

# Asegurarse de que el script SQL también tenga los permisos correctos
RUN chmod +r /usr/src/app/create.sql

# Opcional: volver al usuario mssql para ejecutar SQL Server
USER mssql

# Set custom script as entrypoint
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]