#!/bin/bash
# This script retrieves notes from the database and displays them on a webpage.

echo "Content-type: text/html"
echo ""

# Database connection credentials
DB_USER="root"
DB_PASSWORD="your_password"
DB_NAME="my_notes_db"

# Generate the HTML structure
echo "<!DOCTYPE html>"
echo "<html><head><title>Manage Notes</title></head><body>"
echo "<h1>Saved Notes</h1>"
echo "<ul>"

# Query the database to fetch all notes and their IDs
mysql -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" -sN -e "SELECT id, note FROM notes;" | while read -r id note; do
    # Display each note as a list item with a delete button
    echo "<li>${note} <form style='display:inline;' method='post' action='/cgi-bin/my_notes_app/delete_note.sh'>"
    echo "<input type='hidden' name='id' value='$id'>" # Hidden input to pass the note ID to the delete script
    echo "<button type='submit'>Delete</button></form></li>"
done

echo "</ul>"

# Link to return to the main page
echo "<a href='/my_notes_app/index.html'>Back to Home</a>"

# Close the HTML tags
echo "</body></html>
