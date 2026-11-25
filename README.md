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

## Fase 2: Preguntas de negocio (SQL)

**Ventas mensuales (pedidos entregados)**
- Crecimiento rápido durante 2017: de R$ 112 mil (ene) a R$ 648 mil (oct) al mes.
- Pico en noviembre de 2017 (R$ 988 mil, posiblemente Black Friday).
- En 2018 las ventas se aplanan entre R$ 826 mil y R$ 978 mil mensuales.
- El crecimiento vino del volumen de pedidos; el ticket promedio se mantuvo en ~R$ 130-140.
- 2016 y sep-oct 2018 tienen datos incompletos y se excluyen del análisis de tendencia.

**Categorías**
- Las 10 principales concentran ~62% de los ingresos.
- Líderes: health_beauty, watches_gifts y bed_bath_table.
- bed_bath_table vende más unidades pero genera menos ingresos que
  watches_gifts por su menor precio promedio.