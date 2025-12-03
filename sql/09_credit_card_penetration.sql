-- Overall penetration: how many customers ever used CC?
WITH customer_cc_flag AS (
    SELECT
        c.customer_id,
        MAX(CASE WHEN f.payment_type = 'Credit Card' THEN 1 ELSE 0 END) AS used_cc
    FROM dim_customers c
    JOIN fact_spends f USING (customer_id)
    GROUP BY c.customer_id
)
SELECT
    COUNT(*)                                   AS total_customers,
    SUM(used_cc)                               AS cc_customers,
    SUM(used_cc) / COUNT(*) * 100              AS cc_penetration_pct
FROM customer_cc_flag;


-- Penetration by city / age / occupation
WITH customer_cc_flag AS (
    SELECT
        c.customer_id,
        c.city,
        c.age_group,
        c.occupation,
        MAX(CASE WHEN f.payment_type = 'Credit Card' THEN 1 ELSE 0 END) AS used_cc
    FROM dim_customers c
    JOIN fact_spends f USING (customer_id)
    GROUP BY c.customer_id, c.city, c.age_group, c.occupation
)
SELECT
    city,
    COUNT(*)                      AS customer_count,
    SUM(used_cc)                  AS cc_customers,
    SUM(used_cc) / COUNT(*) * 100 AS cc_penetration_pct
FROM customer_cc_flag
GROUP BY city
ORDER BY cc_penetration_pct DESC;
