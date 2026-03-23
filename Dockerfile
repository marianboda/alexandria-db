FROM pgvector/pgvector:pg18

RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-18-cron \
    make gcc postgresql-server-dev-18 git ca-certificates \
    && git clone https://github.com/michelp/pgjwt.git /tmp/pgjwt \
    && cd /tmp/pgjwt && make install \
    && apt-get purge -y make gcc postgresql-server-dev-18 git \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* /tmp/pgjwt

# Built-in extensions (just need CREATE EXTENSION):
# - pgcrypto
# - pg_stat_statements (needs shared_preload_libraries)
# - pg_trgm
# - btree_gin
# - btree_gist
