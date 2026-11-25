## Fase 1: Exploración inicial de los datos

Base de datos construida con SQLite a partir de los 9 archivos CSV de Olist
(Brazilian E-Commerce Public Dataset).

### Hallazgos

**1. Estado de los pedidos**
Del total de 99,441 pedidos, 96,478 (~97%) fueron entregados (`delivered`).
El resto se reparte entre `shipped`, `canceled`, `unavailable`, `invoiced`,
`processing`, `created` y `approved`.

**2. Periodo que cubre el dataset**
Del 4 de septiembre de 2016 al 17 de octubre de 2018 (aproximadamente 2 años).

**3. Clientes únicos vs. identificadores**
Hay 99,441 `customer_id` y 96,096 clientes únicos (`customer_unique_id`).
Solo ~3.4% de los pedidos corresponden a compras repetidas, lo que sugiere
que la mayoría de los clientes compra una sola vez. Este será un punto clave
en el análisis de retención y en la segmentación RFM.

> Nota técnica: `customer_id` cambia en cada pedido, por lo que para
> identificar personas reales se usa siempre `customer_unique_id`.