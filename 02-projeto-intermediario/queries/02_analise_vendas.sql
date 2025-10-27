-- =============================================
-- PROJETO 02: ANÁLISE DE E-COMMERCE
-- Query 2: Análise de Vendas e Performance Comercial
-- =============================================

-- 1. EVOLUÇÃO MENSAL DE VENDAS
WITH vendas_mensais AS (
    SELECT 
        YEAR(o.order_purchase_timestamp) as ano,
        MONTH(o.order_purchase_timestamp) as mes,
        COUNT(DISTINCT o.order_id) as total_pedidos,
        COUNT(oi.order_item_id) as total_itens,
        ROUND(SUM(oi.price), 2) as valor_total_vendas,
        ROUND(AVG(oi.price), 2) as valor_medio_item
    FROM olist_orders_dataset o
    INNER JOIN olist_order_items_dataset oi 
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY ano, mes
)
SELECT 
    ano,
    mes,
    total_pedidos,
    total_itens,
    valor_total_vendas,
    valor_medio_item,
    ROUND(valor_total_vendas / total_pedidos, 2) as ticket_medio
FROM vendas_mensais
ORDER BY ano, mes;

-- 2. PERFORMANCE POR CATEGORIA DE PRODUTO
SELECT 
    p.product_category_name,
    COUNT(DISTINCT oi.order_id) as total_pedidos,
    COUNT(oi.order_item_id) as total_itens_vendidos,
    ROUND(SUM(oi.price), 2) as valor_total,
    ROUND(AVG(oi.price), 2) as preco_medio
FROM olist_order_items_dataset oi
INNER JOIN olist_products_dataset p 
    ON oi.product_id = p.product_id
INNER JOIN olist_orders_dataset o 
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_category_name
ORDER BY valor_total DESC
LIMIT 15;

-- 3. TOP 10 PRODUTOS MAIS VENDIDOS (VALOR)
SELECT 
    p.product_id,
    p.product_category_name,
    COUNT(oi.order_item_id) as total_vendas,
    ROUND(SUM(oi.price), 2) as valor_total,
    ROUND(AVG(oi.price), 2) as preco_medio
FROM olist_order_items_dataset oi
INNER JOIN olist_products_dataset p 
    ON oi.product_id = p.product_id
INNER JOIN olist_orders_dataset o 
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_id, p.product_category_name
ORDER BY valor_total DESC
LIMIT 10;

-- 4. TOP 10 VENDEDORES MAIS EFICIENTES
SELECT 
    s.seller_id,
    COUNT(DISTINCT oi.order_id) as total_pedidos,
    COUNT(oi.order_item_id) as total_itens_vendidos,
    ROUND(SUM(oi.price), 2) as valor_total_vendas,
    ROUND(AVG(oi.price), 2) as preco_medio_item
FROM olist_order_items_dataset oi
INNER JOIN olist_sellers_dataset s 
    ON oi.seller_id = s.seller_id
INNER JOIN olist_orders_dataset o 
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY s.seller_id
ORDER BY valor_total_vendas DESC
LIMIT 10;
