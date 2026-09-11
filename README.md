# myHackerrank

My personal repository for practicing SQL tasks from [HackerRank](https://www.hackerrank.com/domains/sql). It contains the source data for each task (CSV files), scripts to create and populate the tables, and interesting solution queries.

The database runs in Docker (PostgreSQL) and is automatically seeded with the test data on first container start.

## Project structure

```
myHackerrank/
├── csv/                              # Source data for the tasks (one CSV per table)
├── sql_scripts_сreate_tables/
│   ├── 01_create_tables.sql          # Creates the hac schema and tables
│   └── 02_import_csv.sql             # Imports data from csv/ into the tables
├── dockerfile                        # PostgreSQL image with preloaded data
├── docker-compose.yml                # Runs the database
├── .env.example                      # Example environment variables
└── README.md
```

## Requirements

- [Docker](https://www.docker.com/) and Docker Compose

## Getting started

1. Copy `.env.example` to `.env` and adjust the values if needed:

   ```bash
   cp .env.example .env
   ```

2. Build and start the container:

   ```bash
   docker compose up --build
   ```

3. On first start, PostgreSQL automatically runs the scripts in `sql_scripts_сreate_tables/`: it creates the `hac` schema with all tables and loads the data from `csv/`.

4. Connect to the database on `localhost:5434` (port set in `docker-compose.yml`) using the credentials from `.env`:

   ```bash
   psql -h localhost -p 5434 -U postgres -d postgres
   ```

   All tables live in the `hac` schema, e.g. `SELECT * FROM hac.city;`.

> Data is stored in the named volume `pgdata`, so it survives container restarts. To recreate the database from scratch, remove the volume: `docker compose down -v`.

## Task topics

Tables are grouped by the sections of the HackerRank SQL track:

- **Basic Select** — `city`, `country`, `station`
- **Advanced Select** — `triangles`, `bst`
- **Aggregation** — `occupations`, `employee`
- **Basic Join** — `students`, `grades`, `projects`
- **Advanced Join** — `friends`, `packages`, `wands`, `wands_property`, `company`, `lead_manager`, `senior_manager`, `manager`, `employee_hierarchy`
- **Alternative Queries / Contests** — `contests`, `colleges`, `challenges`, `view_stats`, `submission_stats`
- **30 Days of SQL** — `hackers`, `difficulty`, `submissions`
