-- Create databases
CREATE DATABASE IF NOT EXISTS ingestion;
CREATE DATABASE IF NOT EXISTS analytics;
CREATE DATABASE IF NOT EXISTS staging;
CREATE DATABASE IF NOT EXISTS reporting;
CREATE DATABASE IF NOT EXISTS testing;

-- ------------------------------
-- ingestion database
-- ------------------------------
USE ingestion;

CREATE TABLE IF NOT EXISTS position_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    company VARCHAR(255),
    position_title VARCHAR(255),
    start_date DATE,
    end_date DATE
);

CREATE TABLE IF NOT EXISTS location_mapper_v3 (
    location_id INT PRIMARY KEY,
    raw_location VARCHAR(255),
    standardized_location VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS company2rcid (
    company_name VARCHAR(255),
    rcid INT
);

CREATE TABLE IF NOT EXISTS ingestion_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO position_history (user_id, company, position_title, start_date, end_date) VALUES
(1, 'Company A', 'Data Analyst', '2020-01-01', '2021-06-30'),
(2, 'Company B', 'Software Engineer', '2019-05-01', NULL);

-- ------------------------------
-- analytics database
-- ------------------------------
USE analytics;

CREATE TABLE IF NOT EXISTS user_metrics (
    user_id INT,
    avg_tenure FLOAT,
    last_updated DATE
);

CREATE TABLE IF NOT EXISTS company_growth (
    company_name VARCHAR(255),
    growth_rate FLOAT
);

CREATE TABLE IF NOT EXISTS role_trends (
    position_title VARCHAR(255),
    frequency INT
);

CREATE TABLE IF NOT EXISTS anomalies (
    anomaly_id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT,
    detected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO role_trends (position_title, frequency) VALUES
('Data Analyst', 120),
('Software Engineer', 200);

-- ------------------------------
-- staging database
-- ------------------------------
USE staging;

CREATE TABLE IF NOT EXISTS staging_users (
    user_id INT,
    name VARCHAR(255),
    imported_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS staging_positions (
    position_id INT,
    user_id INT,
    company VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS staging_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    action TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS staging_errors (
    error_id INT AUTO_INCREMENT PRIMARY KEY,
    error_msg TEXT,
    occurred_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ------------------------------
-- reporting database
-- ------------------------------
USE reporting;

CREATE TABLE IF NOT EXISTS monthly_reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    report_month DATE,
    summary TEXT
);

CREATE TABLE IF NOT EXISTS user_transitions (
    transition_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    from_company VARCHAR(255),
    to_company VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS report_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS kpis (
    kpi_name VARCHAR(255),
    value FLOAT
);

-- ------------------------------
-- testing database
-- ------------------------------
USE testing;

CREATE TABLE IF NOT EXISTS test_users (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    test_case VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS test_results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    test_id INT,
    result_status VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS test_cases (
    case_id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT
);

CREATE TABLE IF NOT EXISTS qa_logs (
    qa_id INT AUTO_INCREMENT PRIMARY KEY,
    event TEXT,
    logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO test_cases (description) VALUES
('Check NULL values in company column'),
('Verify date consistency in position history');