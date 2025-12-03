-- Spend by category
SELECT
    category,
    SUM(spend) AS total_spend,
    (SUM(spend) * 100.0) / (SELECT SUM(spend) FROM fact_spends) AS pct_of_total_spend
FROM fact_spends
GROUP BY category
ORDER BY total_spend DESC;

-- Spend by payment type
SELECT
    payment_type,
    SUM(spend) AS total_spend,
    (SUM(spend) * 100.0) / (SELECT SUM(spend) FROM fact_spends) AS pct_of_total_spend
FROM fact_spends
GROUP BY payment_type
ORDER BY total_spend DESC;

-- Category preference by age group
SELECT
    c.age_group,
    f.category,
    SUM(f.spend) AS total_spend
FROM fact_spends f
JOIN dim_customers c USING (customer_id)
GROUP BY c.age_group, f.category
ORDER BY c.age_group, total_spend DESC;

-- Monthly trend by payment type (if month_no exists)
SELECT
    m.month_name,
    f.payment_type,
    SUM(f.spend) AS total_spend
FROM fact_spends f
JOIN dim_month m ON f.month_name = m.month_name
GROUP BY m.month_name, f.payment_type
ORDER BY m.month_no, f.payment_type;
