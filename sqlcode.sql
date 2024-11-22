SELECT * FROM survey
LIMIT 10;

SELECT question, COUNT(DISTINCT user_id) FROM survey
 GROUP BY 1;

SELECT * FROM quiz
LIMIT 5;
SELECT * FROM home_try_on
LIMIT 5;
SELECT * FROM purchase
LIMIT 5;

CREATE TEMPORARY TABLE funnel AS
  SELECT DISTINCT q.user_id AS user_id, h.user_id IS NOT NULL AS is_home_try_on, h.number_of_pairs, p.user_id IS NOT NULL AS is_purchase
  FROM quiz q
  LEFT JOIN home_try_on h
    ON q.user_id = h.user_id
  LEFT JOIN purchase p
    ON q.user_id = p.user_id;

SELECT 
    user_id, 
    CASE 
        WHEN is_home_try_on = 1 THEN 'True'
        ELSE 'False'
    END AS is_home_try_on,
    CASE 
        WHEN is_purchase = 1 THEN 'True'
        ELSE 'False'
    END AS is_purchase
FROM funnels;

SELECT COUNT(user_id) FROM funnel;

SELECT COUNT(is_home_try_on)
FROM funnels
WHERE is_home_try_on = 'True';

SELECT COUNT(is_purchase) FROM funnel
WHERE is_purchase = 'True';

SELECT number_of_pairs, COUNT (is_purchase) FROM funnel
WHERE is_purchase = 'True' 
GROUP BY 1;

SELECT model_name, COUNT(*) FROM purchase
GROUP BY 1
ORDER BY 2 DESC;

