#!/bin/bash

# Indicate that the script will output HTML content
echo "Content-type: text/html"
echo ""

# Read the POST data received from the client
read POST_DATA

# Extract the "note" parameter from the POST data, handle URL encoding,
# and remove any carriage return or newline characters
NOTE=$(echo "$POST_DATA" | sed -n 's/^note=\(.*\)$/\1/p' | tr -d '\r' | tr -d '\n' | sed 's/+/ /g')

# Define MySQL credentials
DB_USER="root"          # Database username
DB_PASSWORD="your_password" # Database password
DB_NAME="my_notes_db"   # Name of the database

# Insert the extracted note into the "notes" table in the database
mysql -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" -e "INSERT INTO notes (note) VALUES ('$NOTE');"

# Output a confirmation message as an HTML page
echo "<html><body><h1>Note Saved!</h1><a href='/my_notes_app/index.html'>Back to Home</a></body></html>"
