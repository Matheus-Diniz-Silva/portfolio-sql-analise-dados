-- =============================================
-- PROJETO 02: ANÁLISE DE E-COMMERCE
-- Query 3: Análise de Clientes e Comportamento
-- =============================================

-- 1. ANÁLISE DE COHORT - RETENÇÃO DE CLIENTES
WITH cohort_analysis AS (
    SELECT 
        customer_id,
        DATE_FORMAT(MIN(order_purchase_timestamp), '%Y-%m') as cohort_month,
        TIMESTAMPDIFF(MONTH, MIN(order_purchase_timestamp), order_purchase_timestamp) as month_number
    FROM olist_orders_dataset
    WHERE order_status = 'delivered'
    GROUP BY customer_id, order_purchase_timestamp
),
cohort_table AS (
    SELECT 
        cohort_month,
        month_number,
        COUNT(DISTINCT customer_id) as num_customers
    FROM cohort_analysis
    GROUP BY cohort_month, month_number
)
SELECT 
    cohort_month,
    MAX(CASE WHEN month_number = 0 THEN num_customers ELSE 0 END) as cohort_size,
    ROUND(MAX(CASE WHEN month_number = 1 THEN num_customers ELSE 0 END) * 100.0 / 
          MAX(CASE WHEN month_number = 0 THEN num_customers ELSE 0 END), 2) as month_1_retention,
    ROUND(MAX(CASE WHEN month_number = 2 THEN num_customers ELSE 0 END) * 100.0 / 
          MAX(CASE WHEN month_number = 0 THEN num_customers ELSE 0 END), 2) as month_2_retention,
    ROUND(MAX(CASE WHEN month_number = 3 THEN num_customers ELSE 0 END) * 100.0 / 
          MAX(CASE WHEN month_number = 0 THEN num_customers ELSE 0 END), 2) as month_3_retention
FROM cohort_table
GROUP BY cohort_month
ORDER BY cohort_month;

-- 2. TOP 10 CLIENTES MAIS VALIOSOS (LIFETIME VALUE)
SELECT 
    c.customer_id,
    c.customer_state,
    COUNT(DISTINCT o.order_id) as total_pedidos,
    ROUND(SUM(oi.price), 2) as total_gasto,
    ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id), 2) as ticket_medio,
    MIN(o.order_purchase_timestamp) as primeira_compra,
    MAX(o.order_purchase_timestamp) as ultima_compra
FROM olist_customers_dataset c
INNER JOIN olist_orders_dataset o ON c.customer_id = o.customer_id
INNER JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_id, c.customer_state
ORDER BY total_gasto DESC
LIMIT 10;

-- 3. COMPORTAMENTO DE COMPRA POR ESTADO
SELECT 
    c.customer_state,
    COUNT(DISTINCT c.customer_id) as total_clientes,
    COUNT(DISTINCT o.order_id) as total_pedidos,
    ROUND(SUM(oi.price), 2) as valor_total_vendas,
    ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id), 2) as ticket_medio_estado,
    ROUND(SUM(oi.price) / COUNT(DISTINCT c.customer_id), 2) as valor_por_cliente
FROM olist_customers_dataset c
INNER JOIN olist_orders_dataset o ON c.customer_id = o.customer_id
INNER JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY valor_total_vendas DESC;

-- 4. CLIENTES RECORRENTES vs ÚNICA COMPRA
WITH compras_por_cliente AS (
    SELECT 
        c.customer_id,
        COUNT(DISTINCT o.order_id) as total_pedidos
    FROM olist_customers_dataset c
    INNER JOIN olist_orders_dataset o ON c.customer_id = o.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_id
)
SELECT 
    CASE 
        WHEN total_pedidos = 1 THEN 'Única Compra'
        WHEN total_pedidos = 2 THEN '2 Compras'
        WHEN total_pedidos >= 3 THEN '3+ Compras'
    END as perfil_cliente,
    COUNT(customer_id) as quantidade_clientes,
    ROUND(COUNT(customer_id) * 100.0 / (SELECT COUNT(*) FROM compras_por_cliente), 2) as percentual
FROM compras_por_cliente
GROUP BY perfil_cliente
ORDER BY quantidade_clientes DESC;
