#!/bin/bash

# Get PostgreSQL version
POSTGRES_VERSION_OUTPUT=$(psql -V)

# Extract PostgreSQL major version
POSTGRESQL_VERSION=$(echo "$POSTGRES_VERSION_OUTPUT" | awk '{print $3}' | cut -d'.' -f1)

# Output the result
echo "PostgreSQL version: $POSTGRESQL_VERSION"

# Step 1: Allow connection from outside. (/etc/postgresql/{VERSION}/main/postgresql.conf)
# POSTGRESQL_VERSION=$1
PG_CONF_FILE="/etc/postgresql/$POSTGRESQL_VERSION/main/postgresql.conf"

# Check if the configuration file exists
if [ ! -f "$PG_CONF_FILE" ]; then
  echo "Error: PostgreSQL configuration file not found at $PG_CONF_FILE"
  exit 1
fi

# Backup the original configuration file
cp "$PG_CONF_FILE" "${PG_CONF_FILE}.bak"

# Modify the 'listen_addresses' setting from 'localhost' to '*'
sed -i "s/^#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF_FILE"
sed -i "s/^listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF_FILE"

echo "Updated 'listen_addresses' to '*' in $PG_CONF_FILE"


# Step 2: Allow other connections with appropriate connection encryption. (/etc/postgresql/{VERSION}/main/pg_hba.conf)
echo host all all 0.0.0.0/0 md5 >> /etc/postgresql/$POSTGRESQL_VERSION/main/pg_hba.conf