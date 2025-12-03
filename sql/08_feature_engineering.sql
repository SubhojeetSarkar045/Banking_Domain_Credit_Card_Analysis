-- Income bracket creation
ALTER TABLE dim_customers ADD COLUMN income_bracket VARCHAR(20);

UPDATE dim_customers
SET income_bracket =
    CASE
        WHEN avg_income < 30000 THEN 'Low'
        WHEN avg_income BETWEEN 30000 AND 70000 THEN 'Mid'
        ELSE 'High'
    END;


SELECT income_bracket, COUNT(*) AS customer_count, AVG(avg_income) AS avg_income
FROM dim_customers
GROUP BY income_bracket
ORDER BY AVG(avg_income);