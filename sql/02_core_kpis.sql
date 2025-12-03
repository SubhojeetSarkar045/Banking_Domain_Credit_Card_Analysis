-- Total customers
SELECT COUNT(*) AS total_customers
FROM dim_customers;

-- Total spend
SELECT SUM(spend) AS total_spend
FROM fact_spends;

-- Avg spend per customer
SELECT
    SUM(spend) / COUNT(DISTINCT customer_id) AS avg_spend_per_customer
FROM fact_spends;

-- Avg income
SELECT AVG(avg_income) AS avg_income
FROM dim_customers;

-- Average income utilisation %  (overall)
SELECT
    (SUM(f.spend) * 100.0) / SUM(c.avg_income) AS income_utilization_pct
FROM fact_spends f
JOIN dim_customers c USING (customer_id);
