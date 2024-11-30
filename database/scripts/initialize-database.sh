#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "💭 Initializing database..."

# Define the database file
DATABASE_FILE="/database/data/database.db"

# Execute the SQL scripts over the database
sqlite3 $DATABASE_FILE < /database/scripts/ddl/pedidos-create.sql
sqlite3 $DATABASE_FILE < /database/scripts/dml/pedidos-insert.sql
#sqlite3 $DATABASE_FILE < /database/scripts/ddl/test.sql
#sqlite3 $DATABASE_FILE < /database/scripts/dml/test.sql

echo "✅ Database initialized successfully!"

# Keep the connection to the database alive
tail -f /dev/null
