-- Top segments by total spend and utilisation
SELECT
    c.city,
    c.age_group,
    c.gender,
    c.marital_status,
    c.occupation,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    SUM(f.spend)                  AS total_spend,
    (SUM(f.spend) * 100.0) / SUM(c.avg_income) AS income_utilization_pct
FROM dim_customers c
JOIN fact_spends f USING (customer_id)
GROUP BY
    c.city, c.age_group, c.gender, c.marital_status, c.occupation
ORDER BY total_spend DESC
LIMIT 20;
