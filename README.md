# SQL Data Engineering Project – Ingestion and Transformation

This project demonstrates the setup, ingestion, and transformation of relational data using **MySQL**, **SQL scripts**, and **Python**.

> ⚠️ Note: This project is a personal exercise inspired by a technical challenge. Company-specific data and names have been removed to ensure confidentiality.
> Dummy databases and Tables used: Please check code before implementing

---

## 🔧 Setup Instructions

1. **Install MySQL and Dependencies** (macOS example)
    - Install Homebrew  
    - Install Homebrew on macOS
    - Install MySQL latest version
    - Install wget
    - Install mysql-connector-python
**Process**
Since I am working on a macOS, I installed Homebrew, which is a package manager for macOS that helps you install, update, and manage software easily from the command line. 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
After confirming the installation, I made sure the following command is run in the path folder were I will be running the mySQL command echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/mu_user_name/.zprofile   eval "$(/opt/homebrew/bin/brew shellenv)". See below for other sequential commands that were ran:
•	brew install msql Used to install the mysql service
•	brew install wgetUsed to download the ingestion.sql
•	wget https://path_to_file/ingest.sql--
•	brew services start mysqlUsed to start the mysql service
•	mysql -u root -p  To open and access MySQL as root user
After some installs and accessing the service, I used the following commands to update my credentials
•	CREATE USER ‘user_name’@’localhost’ IDENTIFIED BY ‘password’; setting new connection string for my Python script login.
•	Exit; to log out the service
While in root user mode, I created the following permissions
•	GRANT ALL ON *.* TO ‘user_name’@’localhost’;



2. **Create MySQL User**
    - Run `setup/create_user_and_permissions.sql` to configure database access.

3. **Create and Load Databases**
   `These steps are already automated in createDB_ingestData.py script`
    - Run `setup/create_databases.sql` to create base databases.
    - Load data using:
      ```bash
      mysql -u your_user -p INGESTION < setup/ingest.sql
      ```

---

## 🧠 Project Tasks
`Transformation`
### ✅ A. Transformation file
From a historical position table, filter the most recent record per user and insert into `new_table`.

→ See: `setup/Transform.sql`

---

## 💻 Python Utilities

- `createDB_ingestDataDB.py`: Programmatically sets up MySQL databases.
- `TransformPipeline.py`: Automates data transformation from `Transform.sql`

---

## 📘 Documentation

See `documentation/setup_walkthrough.md` for full installation and configuration steps.

---

## 🚀 Skills Demonstrated

- SQL transformations
- Data modeling & pipeline logic
- Python-based MySQL operations
- MySQL user/permission setup
- MacOS CLI automation for data setup

---

## 🔒 Disclaimer

This project contains no real or company-provided data. All database and schema design has been anonymized or recreated for demonstration purposes only.
This project contains dummy databases and tables and might have some bugs. The project is only intended to give guidelines on how to run an ETL process using scripts and commands.
