
SELECT address,
    ROUND(MAX(age)-MIN(age)/MAX(age::numeric), 2)::REAL AS formula,
    ROUND(AVG(age), 2)::real AS average,
    CASE WHEN MAX(age)-MIN(age)/MAX(age::numeric) > AVG(age) THEN 'true'
    ELSE 'false'
    END comparison
FROM person
GROUP BY address
ORDER BY 1;

