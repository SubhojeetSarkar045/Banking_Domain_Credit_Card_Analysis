-- 1. Row counts
SELECT 'dim_customers' AS table_name, COUNT(*) AS row_count FROM dim_customers
UNION ALL
SELECT 'fact_spends', COUNT(*) FROM fact_spends;

-- 2. Duplicate customers
SELECT customer_id, COUNT(*) AS cnt
FROM dim_customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 3. Null check for key fields
SELECT
  SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
  SUM(CASE WHEN avg_income  IS NULL THEN 1 ELSE 0 END) AS null_income,
  SUM(CASE WHEN city        IS NULL THEN 1 ELSE 0 END) AS null_city
FROM dim_customers;

SELECT
  SUM(CASE WHEN customer_id  IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
  SUM(CASE WHEN category     IS NULL THEN 1 ELSE 0 END) AS null_category,
  SUM(CASE WHEN payment_type IS NULL THEN 1 ELSE 0 END) AS null_payment_type,
  SUM(CASE WHEN spend        IS NULL THEN 1 ELSE 0 END) AS null_spend
FROM fact_spends;

-- 4. Basic ranges / outliers
SELECT
    MIN(avg_income) AS min_income,
    MAX(avg_income) AS max_income
FROM dim_customers;

SELECT
    MIN(spend) AS min_spend,
    MAX(spend) AS max_spend
FROM fact_spends;
