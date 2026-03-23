FROM pgvector/pgvector:pg18

RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-18-cron \
    postgresql-18-pgjwt \
    && rm -rf /var/lib/apt/lists/*

# Built-in extensions (just need CREATE EXTENSION):
# - pgcrypto
# - pg_stat_statements (needs shared_preload_libraries)
# - pg_trgm
# - btree_gin
# - btree_gist
