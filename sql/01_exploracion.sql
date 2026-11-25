-- 1. ¿Cuántos pedidos hay y qué estados tienen?
SELECT order_status, COUNT(*) AS total
FROM orders
GROUP BY order_status
ORDER BY total DESC;

-- 2. ¿Qué rango de fechas cubre el dataset?
SELECT MIN(order_purchase_timestamp) AS primera_compra,
       MAX(order_purchase_timestamp) AS ultima_compra
FROM orders;

-- 3. ¿Cuántos clientes únicos hay vs. cuántos customer_id?
SELECT COUNT(DISTINCT customer_id) AS customer_ids,
       COUNT(DISTINCT customer_unique_id) AS clientes_unicos
FROM customers;

