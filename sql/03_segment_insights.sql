-- Spend & utilisation by city
SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    SUM(f.spend)                  AS total_spend,
    AVG(c.avg_income)             AS avg_income,
    (SUM(f.spend) * 100.0) / SUM(c.avg_income) AS income_utilization_pct
FROM dim_customers c
JOIN fact_spends f USING (customer_id)
GROUP BY c.city
ORDER BY total_spend DESC;

-- Spend & utilisation by age group
SELECT
    c.age_group,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    SUM(f.spend)                  AS total_spend,
    (SUM(f.spend) * 100.0) / SUM(c.avg_income) AS income_utilization_pct
FROM dim_customers c
JOIN fact_spends f USING (customer_id)
GROUP BY c.age_group
ORDER BY income_utilization_pct DESC;

-- Spend & utilisation by gender
SELECT
    c.gender,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    SUM(f.spend)                  AS total_spend,
    (SUM(f.spend) * 100.0) / SUM(c.avg_income) AS income_utilization_pct
FROM dim_customers c
JOIN fact_spends f USING (customer_id)
GROUP BY c.gender
ORDER BY total_spend DESC;

-- Spend & utilisation by occupation
SELECT
    c.occupation,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    SUM(f.spend)                  AS total_spend,
    (SUM(f.spend) * 100.0) / SUM(c.avg_income) AS income_utilization_pct
FROM dim_customers c
JOIN fact_spends f USING (customer_id)
GROUP BY c.occupation
ORDER BY total_spend DESC;
