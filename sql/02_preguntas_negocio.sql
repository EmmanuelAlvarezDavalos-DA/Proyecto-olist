-- 1. ¿Cómo evolucionaron las ventas mes a mes? (solo pedidos entregados)
SELECT strftime('%Y-%m', o.order_purchase_timestamp) AS mes,
       COUNT(DISTINCT o.order_id) AS pedidos,
       ROUND(SUM(oi.price), 2) AS ingresos
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY mes
ORDER BY mes;

-- 2. ¿Qué categorías generan más ingresos? (top 10)
SELECT COALESCE(t.product_category_name_english, p.product_category_name) AS categoria,
       COUNT(*) AS articulos_vendidos,
       ROUND(SUM(oi.price), 2) AS ingresos
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation t
       ON p.product_category_name = t.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY categoria
ORDER BY ingresos DESC
LIMIT 10;

-- 3. ¿Cómo afectan los retrasos de entrega a la calificación?
SELECT
  CASE
    WHEN julianday(o.order_delivered_customer_date) <= julianday(o.order_estimated_delivery_date)
      THEN 'A tiempo'
    ELSE 'Con retraso'
  END AS entrega,
  COUNT(*) AS pedidos,
  ROUND(AVG(r.review_score), 2) AS calificacion_promedio
FROM orders o
JOIN order_reviews r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY entrega;
