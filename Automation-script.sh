#!/bin/bash

# Function to check CPU and memory usage
check_cpu_memory_usage() {
  echo "=============================================="
  echo "TOP 5 CPU-CONSUMING PROCESSES:"
  echo "=============================================="
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
  echo ""

  echo "=============================================="
  echo "TOP 5 MEMORY-CONSUMING PROCESSES:"
  echo "=============================================="
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
  echo ""
}

# Function to perform MySQL backup
backup_mysql_db() {
  # Define MySQL credentials and backup path
  DB_USER="user"
  DB_PASSWORD="Admin@123"
  DB_NAME="Test_db"
  BACKUP_PATH="/home/databases/backup"
  BACKUP_FILE="$BACKUP_PATH/${DB_NAME}_backup_$(date +%F_%T).sql"

  # Create a backup directory if it doesn't exist
  if [ ! -d "$BACKUP_PATH" ]; then
    mkdir -p "$BACKUP_PATH"
  fi

  # Backup the MySQL database
  echo "Starting MySQL backup..."
  mysqldump -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "$BACKUP_FILE"

  # Check if the backup was successful
  if [ $? -eq 0 ]; then
    echo "MySQL backup completed successfully. Backup saved at: $BACKUP_FILE"
  else
    echo "MySQL backup failed!"
  fi
}

# Main script starts here

# Run CPU and memory usage check
echo "Running system monitoring for CPU and memory usage..."
check_cpu_memory_usage

# Run MySQL backup
echo "Running MySQL backup script..."
backup_mysql_db
