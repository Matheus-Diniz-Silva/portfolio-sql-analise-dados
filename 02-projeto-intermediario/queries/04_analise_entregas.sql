-- =============================================
-- PROJETO 02: ANÁLISE DE E-COMMERCE
-- Query 4: Análise de Entregas e Experiência do Cliente
-- =============================================

-- 1. PERFORMANCE DE ENTREGA POR ESTADO
SELECT 
    c.customer_state as estado,
    COUNT(o.order_id) as total_pedidos,
    ROUND(AVG(TIMESTAMPDIFF(DAY, 
        o.order_purchase_timestamp, 
        o.order_delivered_customer_date)), 2) as tempo_medio_entrega_dias,
    ROUND(AVG(TIMESTAMPDIFF(DAY,
        o.order_estimated_delivery_date,
        o.order_delivered_customer_date)), 2) as diferenca_estimado_real,
    ROUND(SUM(CASE 
        WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date 
        THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as percentual_entrega_no_prazo
FROM olist_orders_dataset o
INNER JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
    AND o.order_delivered_customer_date IS NOT NULL
    AND o.order_estimated_delivery_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY percentual_entrega_no_prazo DESC;

-- 2. CORRELAÇÃO ENTRE TEMPO DE ENTREGA E AVALIAÇÃO
WITH tempo_avaliacao AS (
    SELECT 
        o.order_id,
        TIMESTAMPDIFF(DAY, o.order_purchase_timestamp, o.order_delivered_customer_date) as dias_entrega,
        CASE 
            WHEN TIMESTAMPDIFF(DAY, o.order_estimated_delivery_date, o.order_delivered_customer_date) > 0 
            THEN 'Atrasado' ELSE 'No Prazo' 
        END as status_entrega,
        r.review_score
    FROM olist_orders_dataset o
    INNER JOIN olist_order_reviews_dataset r ON o.order_id = r.order_id
    WHERE o.order_status = 'delivered'
        AND o.order_delivered_customer_date IS NOT NULL
        AND r.review_score IS NOT NULL
)
SELECT 
    status_entrega,
    AVG(review_score) as nota_media,
    COUNT(*) as total_avaliacoes,
    ROUND(SUM(CASE WHEN review_score >= 4 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as percentual_notas_boas
FROM tempo_avaliacao
GROUP BY status_entrega
ORDER BY nota_media DESC;

-- 3. ANÁLISE DE AVALIAÇÕES POR CATEGORIA DE PRODUTO
SELECT 
    p.product_category_name as categoria,
    COUNT(r.review_id) as total_avaliacoes,
    ROUND(AVG(r.review_score), 2) as nota_media,
    ROUND(SUM(CASE WHEN r.review_score = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as percentual_nota_1,
    ROUND(SUM(CASE WHEN r.review_score = 5 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as percentual_nota_5
FROM olist_order_reviews_dataset r
INNER JOIN olist_orders_dataset o ON r.order_id = o.order_id
INNER JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
INNER JOIN olist_products_dataset p ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered'
    AND r.review_score IS NOT NULL
GROUP BY p.product_category_name
HAVING total_avaliacoes >= 100
ORDER BY nota_media DESC
LIMIT 15;

-- 4. TOP E BOTTOM VENDEDORES POR AVALIAÇÃO (VERSÃO CORRIGIDA)
-- Primeiro: TOP vendedores
SELECT 
    'TOP' as classificacao,
    s.seller_id,
    COUNT(r.review_id) as total_avaliacoes,
    ROUND(AVG(r.review_score), 2) as nota_media,
    COUNT(DISTINCT o.order_id) as total_pedidos
FROM olist_sellers_dataset s
INNER JOIN olist_order_items_dataset oi ON s.seller_id = oi.seller_id
INNER JOIN olist_orders_dataset o ON oi.order_id = o.order_id
INNER JOIN olist_order_reviews_dataset r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
    AND r.review_score IS NOT NULL
GROUP BY s.seller_id
HAVING total_avaliacoes >= 10
ORDER BY nota_media DESC
LIMIT 10;

-- Segundo: BOTTOM vendedores  
SELECT 
    'BOTTOM' as classificacao,
    s.seller_id,
    COUNT(r.review_id) as total_avaliacoes,
    ROUND(AVG(r.review_score), 2) as nota_media,
    COUNT(DISTINCT o.order_id) as total_pedidos
FROM olist_sellers_dataset s
INNER JOIN olist_order_items_dataset oi ON s.seller_id = oi.seller_id
INNER JOIN olist_orders_dataset o ON oi.order_id = o.order_id
INNER JOIN olist_order_reviews_dataset r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
    AND r.review_score IS NOT NULL
GROUP BY s.seller_id
HAVING total_avaliacoes >= 10
ORDER BY nota_media ASC
LIMIT 10;

-- 5. MÉTRICAS DE SATISFAÇÃO GERAIS
SELECT 
    COUNT(r.review_id) as total_avaliacoes,
    ROUND(AVG(r.review_score), 2) as nota_media_geral,
    ROUND(SUM(CASE WHEN r.review_score >= 4 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as satisfacao_geral_percentual,
    ROUND(SUM(CASE WHEN r.review_score <= 2 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as insatisfacao_geral_percentual
FROM olist_order_reviews_dataset r
INNER JOIN olist_orders_dataset o ON r.order_id = o.order_id
WHERE o.order_status = 'delivered';
