-- Customer level summary: total spend, CC spend, utilisation
SELECT
    c.customer_id,
    c.city,
    c.age_group,
    c.gender,
    c.marital_status,
    c.occupation,
    c.avg_income,
    SUM(f.spend)                                       AS total_spend,
    SUM(CASE WHEN f.payment_type = 'Credit Card'
             THEN f.spend ELSE 0 END)                  AS cc_spend,
    (SUM(f.spend) * 100.0) / SUM(c.avg_income)         AS income_utilization_pct,
    (SUM(CASE WHEN f.payment_type = 'Credit Card'
             THEN f.spend ELSE 0 END) * 100)
    / SUM(f.spend)                                     AS pct_spend_by_cc
FROM dim_customers c
JOIN fact_spends f USING (customer_id)
GROUP BY
    c.customer_id, c.city, c.age_group, c.gender,
    c.marital_status, c.occupation, c.avg_income;


-- Top 20 customers by credit card spend
SELECT *
FROM (
    SELECT
    c.customer_id,
    c.city,
    c.age_group,
    c.gender,
    c.marital_status,
    c.occupation,
    c.avg_income,
    SUM(f.spend)                                       AS total_spend,
    SUM(CASE WHEN f.payment_type = 'Credit Card'
             THEN f.spend ELSE 0 END)                  AS cc_spend,
    (SUM(f.spend) * 100.0) / SUM(c.avg_income)         AS income_utilization_pct,
    (SUM(CASE WHEN f.payment_type = 'Credit Card'
             THEN f.spend ELSE 0 END) * 100)
    / SUM(f.spend)                                     AS pct_spend_by_cc
FROM dim_customers c
JOIN fact_spends f USING (customer_id)
GROUP BY
    c.customer_id, c.city, c.age_group, c.gender,
    c.marital_status, c.occupation, c.avg_income
) cs
ORDER BY cc_spend DESC
LIMIT 20;
