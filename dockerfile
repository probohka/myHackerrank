# Use the official PostgreSQL image from the Docker Hub
FROM postgres:latest

# Copy the CSV files into a directory inside the container
COPY csv /var/lib/postgresql/csv

# Copy the initialization scripts into the Docker entrypoint directory
COPY sql_scripts /docker-entrypoint-initdb.d

# Expose the PostgreSQL port (default 5432) in container
EXPOSE 5432
