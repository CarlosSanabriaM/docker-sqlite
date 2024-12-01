#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Only run the SQL scripts if the environment variable is set to true
if [ "$RECREATE_DATABASE_WITH_INITIAL_TEST_DATA" = "true" ]; then
    echo "💭 Recreating and initializing the database..."

    # Define the database file
    DATABASE_FILE="/database/data/database.db"
  
    # Execute the SQL scripts over the database
    sqlite3 $DATABASE_FILE < /database/scripts/ddl/pedidos-create.sql
    sqlite3 $DATABASE_FILE < /database/scripts/dml/pedidos-insert.sql
  
    echo "✅ Database recreated and initialized successfully"
else
    echo "⏩ Skipped execution of scripts that recreate and initialize the database"
fi

# Keep the connection to the database alive
echo "🚀 Database container is running..."
tail -f /dev/null
