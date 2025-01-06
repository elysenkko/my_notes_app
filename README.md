# MY NOTES APP


### About  
**My Notes App** is a fully Bash-implemented application designed for managing text notes. It interacts with a MySQL database and provides a lightweight web interface through CGI scripts. The app is optimized for Linux environments and has been tested on Debian-based systems.  

---

### Installation and Setup  

#### 1. **Dependencies**  
Before running the application, ensure the following packages are installed:  
- `apache2` (or any CGI-compatible web server)  
- `mariadb-server` (or MySQL)  

To install them on Debian-based systems:  
```bash  
sudo apt update  
sudo apt install apache2 mariadb-server  
```  

#### 2. **Database Preparation**  

2.1. **Create the Database and User**  
After installing MariaDB, configure the required database and user:  
```sql  
CREATE DATABASE my_notes_db;  
CREATE USER 'my_notes_user'@'localhost' IDENTIFIED BY 'your_secure_password';  
GRANT ALL PRIVILEGES ON my_notes_db.* TO 'my_notes_user'@'localhost';  
FLUSH PRIVILEGES;  
```  

2.2. **Create the Table**  
Create a table for storing notes:  
```sql  
USE my_notes_db;  
CREATE TABLE notes (  
    id INT AUTO_INCREMENT PRIMARY KEY,  
    note TEXT NOT NULL  
);  
```  

#### 3. **Configure the Web Server**  
Enable CGI support on your web server:  
```bash  
sudo a2enmod cgi  
sudo systemctl restart apache2  
```  
Move the Bash scripts (`create_note.sh`, `delete_note.sh`, `notes_page.sh`) to the `/usr/lib/cgi-bin/my_notes_app/` directory and set executable permissions:  
```bash  
sudo chmod +x /usr/lib/cgi-bin/my_notes_app/*.sh  
```  

#### 4. **Run the Application**  
Once setup is complete, navigate to `http://localhost/cgi-bin/my_notes_app/` to access the application.  

---

### Features  
1. **Create Notes**: Add new notes through a simple HTML form.  
2. **View Notes**: Display a list of all saved notes retrieved from the database.  
3. **Delete Notes**: Remove specific notes with the click of a button.  
4. **Minimal Interface**: A lightweight, functional interface built with Bash scripts and HTML.  

---

### Future Plans  
Future updates will include a notification system to alert users when others interact with shared notes. This feature will enhance real-time collaboration and improve the overall user experience.  

---  

