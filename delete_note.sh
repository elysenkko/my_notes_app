#!/bin/bash

# Indicate that the script will output HTML content
echo "Content-type: text/html"
echo ""

# Read the POST data received from the client
read POST_DATA

# Extract the "id" parameter from the POST data
ID=$(echo "$POST_DATA" | sed -n 's/^id=\(.*\)$/\1/p')

# Define MySQL credentials
DB_USER="root"          # Database username
DB_PASSWORD="your_password" # Database password
DB_NAME="my_notes_db"   # Name of the database

# Execute a SQL query to delete the note with the specified ID from the "notes" table
mysql -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" -e "DELETE FROM notes WHERE id=$ID;"

# Output a confirmation message as an HTML page with navigation options
echo "<html><body><h1>Note Deleted!</h1>"
echo "<a href='/cgi-bin/my_notes_app/notes_page.sh'>Back to Notes</a>"  # Link to the notes page
echo "<a href='/my_notes_app/index.html'>Back to Home</a>"             # Link to the homepage
echo "</body></html>"
