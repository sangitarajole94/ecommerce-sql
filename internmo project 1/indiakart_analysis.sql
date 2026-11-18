SELECT COUNT(*) FROM indiakart_data;
SELECT 
    segment, 
    COUNT(*) AS total_customers,
    SUM(total_spent) AS total_revenue,
    ROUND(AVG(total_spent), 2) AS avg_spend_per_customer
FROM indiakart_data
GROUP BY segment
ORDER BY total_revenue DESC;
SELECT 
    state, 
    COUNT(*) AS total_customers,
    SUM(total_spent) AS total_state_revenue,
    ROUND(AVG(total_spent), 2) AS avg_spend_per_customer
FROM indiakart_data
GROUP BY state
ORDER BY total_state_revenue DESC;
SELECT 
    is_active, 
    COUNT(*) AS total_customers,
    ROUND(COUNT(*)::numeric * 100.0 / (SELECT COUNT(*) FROM indiakart_data), 2) AS percentage
FROM indiakart_data
GROUP BY is_active;
SELECT 
    CASE 
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 35 THEN '25-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+' 
    END AS age_group,
    COUNT(*) AS customer_count,
    SUM(total_spent) AS total_revenue,
    ROUND(AVG(total_spent), 2) AS avg_spent
FROM indiakart_data
GROUP BY age_group
ORDER BY total_revenue DESC;
SELECT 
    total_orders, 
    COUNT(*) AS customer_count,
    SUM(total_spent) AS total_revenue,
    ROUND(AVG(total_spent), 2) AS avg_spent_per_customer
FROM indiakart_data
GROUP BY total_orders
ORDER BY total_orders DESC;