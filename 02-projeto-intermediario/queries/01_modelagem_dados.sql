-- =============================================
-- PROJETO 02: ANÁLISE DE E-COMMERCE
-- Query 1: Modelagem e Relacionamento de Dados
-- =============================================

-- 1. VISÃO GERAL DO ECOSSISTEMA
-- Contagem de registros por tabela
SELECT 
    'Customers' as tabela,
    COUNT(*) as total_registros
FROM olist_customers_dataset

UNION ALL

SELECT 
    'Orders' as tabela,
    COUNT(*) 
FROM olist_orders_dataset

UNION ALL

SELECT 
    'Order Items' as tabela,
    COUNT(*) 
FROM olist_order_items_dataset

UNION ALL

SELECT 
    'Products' as tabela,
    COUNT(*) 
FROM olist_products_dataset

UNION ALL

SELECT 
    'Sellers' as tabela,
    COUNT(*) 
FROM olist_sellers_dataset

UNION ALL

SELECT 
    'Order Payments' as tabela,
    COUNT(*) 
FROM olist_order_payments_dataset

UNION ALL

SELECT 
    'Order Reviews' as tabela,
    COUNT(*) 
FROM olist_order_reviews_dataset;

-- 2. CHAVES PRIMÁRIAS E ESTRANGEIRAS
-- Identificar relações entre tabelas
SELECT 
    'Customers: customer_id -> Orders: customer_id' as relacionamento

UNION ALL

SELECT 'Orders: order_id -> Order Items: order_id'

UNION ALL

SELECT 'Products: product_id -> Order Items: product_id'

UNION ALL

SELECT 'Sellers: seller_id -> Order Items: seller_id'

UNION ALL

SELECT 'Orders: order_id -> Order Payments: order_id'

UNION ALL

SELECT 'Orders: order_id -> Order Reviews: order_id';

-- 3. PERÍODO DOS DADOS
SELECT 
    MIN(order_purchase_timestamp) as data_inicial,
    MAX(order_purchase_timestamp) as data_final,
    DATEDIFF(MAX(order_purchase_timestamp), MIN(order_purchase_timestamp)) as total_dias
FROM olist_orders_dataset;
