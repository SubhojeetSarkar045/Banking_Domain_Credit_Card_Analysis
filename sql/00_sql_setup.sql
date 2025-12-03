CREATE DATABASE mitron_bank;
USE mitron_bank;

CREATE TABLE dim_customers (
    customer_id      VARCHAR(50) PRIMARY KEY,
    age_group        VARCHAR(20),
	city             VARCHAR(50),
	occupation       VARCHAR(100),
	gender           VARCHAR(10),
    marital_status   VARCHAR(10),
    avg_income       INT
);

SELECT * FROM dim_customers;

COPY dim_customers(customer_id,age_group,city,occupation,gender,marital_status,avg_income)
FROM 'C:\dim_customers.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE dim_month (
    month_name      VARCHAR(50) PRIMARY KEY,
    month_no       INT
);

SELECT * FROM dim_month;

COPY dim_month(month_name,month_no)
FROM 'C:\dim_month.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE fact_spends (
    customer_id   VARCHAR(50),
    month_name    VARCHAR(20),
    category      VARCHAR(50),
	payment_type  VARCHAR(50),
    spend         INT,
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
	FOREIGN KEY (month_name) REFERENCES dim_month(month_name)
);

SELECT * FROM fact_spends;

COPY fact_spends(customer_id,month_name,category,payment_type,spend)
FROM 'C:\fact_spends.csv'
DELIMITER ','
CSV HEADER;