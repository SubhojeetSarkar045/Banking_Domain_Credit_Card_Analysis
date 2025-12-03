-- Average active months by age group
WITH customer_activity AS (
    SELECT
        customer_id,
        COUNT(DISTINCT month_name) AS active_months
    FROM fact_spends
    GROUP BY customer_id
)
SELECT
    c.age_group,
    AVG(a.active_months) AS avg_active_months
FROM customer_activity a
JOIN dim_customers c USING (customer_id)
GROUP BY c.age_group
ORDER BY avg_active_months DESC;
