-- SQL script to create a MySQL user and grant permissions

-- Replace 'user_name' and 'password' with your actual values
CREATE USER 'user_name'@'localhost' IDENTIFIED BY 'password';

-- Grant full privileges to the new user
GRANT ALL ON *.* TO 'user_name'@'localhost';

-- Apply the changes
FLUSH PRIVILEGES;