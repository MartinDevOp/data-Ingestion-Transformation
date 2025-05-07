-- SQL script to create 5 empty databases

CREATE DATABASE IF NOT EXISTS ingestion;
CREATE DATABASE IF NOT EXISTS analytics;
CREATE DATABASE IF NOT EXISTS staging;
CREATE DATABASE IF NOT EXISTS reporting;
CREATE DATABASE IF NOT EXISTS testing;

-- Optional: Show created databases (uncomment if executing in an interactive environment)
-- SHOW DATABASES;