# Use the official PostgreSQL image from the Docker Hub
FROM postgres:latest

# Set environment variables
ENV POSTGRES_USER=postgres
ENV POSTGRES_DB=postgres

# Copy the CSV files into a directory inside the container
COPY csv /var/lib/postgresql/csv

# Copy the initialization scripts into the Docker entrypoint directory
COPY sql_scripts /docker-entrypoint-initdb.d

# Expose the PostgreSQL port (default 5432)
EXPOSE 5434

# Run the PostgreSQL server
CMD ["postgres"]
