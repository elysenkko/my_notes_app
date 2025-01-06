# my_notes_app

About
My Notes App is a pure Bash implementation of a simple web application designed for managing text notes. The application features database interactions using MySQL and provides a lightweight, minimal web interface via CGI scripts. It is tailored for Linux environments, specifically tested on Debian-based distributions.

Installation and Setup
1. Dependencies
Before running the application, ensure the following packages are installed:

apache2 (or any CGI-compatible web server)
mariadb-server (or MySQL server)
To install them on Debian-based systems:


sudo apt update  
sudo apt install apache2 mariadb-server  
2. Database Preparation
2.1. Create the Database and User
After installing MariaDB, set up the required database schema and user:


CREATE DATABASE my_notes_db;  
CREATE USER 'my_notes_user'@'localhost' IDENTIFIED BY 'your_secure_password';  
GRANT ALL PRIVILEGES ON my_notes_db.* TO 'my_notes_user'@'localhost';  
FLUSH PRIVILEGES;  
2.2. Create the Table
Create a table for storing notes:


USE my_notes_db;  
CREATE TABLE notes (  
    id INT AUTO_INCREMENT PRIMARY KEY,  
    note TEXT NOT NULL  
);  
3. Configure the Web Server
Enable CGI on your web server:


sudo a2enmod cgi  
sudo systemctl restart apache2  
Place the Bash scripts (create_note.sh, delete_note.sh, notes_page.sh) in the /usr/lib/cgi-bin/my_notes_app/ directory and set executable permissions:


sudo chmod +x /usr/lib/cgi-bin/my_notes_app/*.sh  
4. Run the Application
Once the setup is complete, navigate to http://localhost/cgi-bin/my_notes_app/ to access the app.

Features
Create Notes: Add new notes through a simple HTML form.
View Notes: See a list of all saved notes retrieved dynamically from the database.
Delete Notes: Remove specific notes with the click of a button.
Minimal Interface: Built with Bash scripts and HTML, ensuring a lightweight and functional experience.
Future Plans
In future updates, I plan to introduce a notification system that will alert users when others interact with shared notes or collaborate on the platform. This feature will enhance real-time engagement and improve the overall user experience.


