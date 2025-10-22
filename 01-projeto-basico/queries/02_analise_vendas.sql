-- =============================================
-- PROJETO 01: ANÁLISE DE VENDAS
-- Query 2: Análise de Performance de Vendas
-- =============================================

-- 1. TOP 10 PRODUTOS MAIS VENDIDOS (VALOR)
SELECT 
    PRODUCTCODE,
    PRODUCTLINE,
    SUM(QUANTITYORDERED) as total_quantidade,
    ROUND(SUM(SALES), 2) as valor_total_vendas,
    ROUND(AVG(PRICEEACH), 2) as preco_medio
FROM sales_data
GROUP BY PRODUCTCODE, PRODUCTLINE
ORDER BY valor_total_vendas DESC
LIMIT 10;

-- 2. MÉTRICAS DE PERFORMANCE POR LINHA DE PRODUTO
SELECT 
    PRODUCTLINE,
    COUNT(*) as total_vendas,
    ROUND(SUM(SALES), 2) as valor_total,
    ROUND(AVG(SALES), 2) as ticket_medio,
    ROUND(SUM(SALES) * 100.0 / (SELECT SUM(SALES) FROM sales_data), 2) as percentual_faturamento
FROM sales_data
GROUP BY PRODUCTLINE
ORDER BY valor_total DESC;

-- 3. ANÁLISE DE PREÇOS E MARGEM
SELECT 
    PRODUCTLINE,
    ROUND(AVG(PRICEEACH), 2) as preco_venda_medio,
    ROUND(AVG(MSRP), 2) as preco_sugerido_medio,
    ROUND(AVG(MSRP - PRICEEACH), 2) as diferenca_media
FROM sales_data
GROUP BY PRODUCTLINE
ORDER BY diferenca_media DESC;

-- 4. EFICIÊNCIA DE VENDAS POR TAMANHO DE NEGÓCIO
SELECT 
    DEALSIZE,
    COUNT(*) as total_vendas,
    ROUND(SUM(SALES), 2) as valor_total,
    ROUND(AVG(SALES), 2) as valor_medio_venda,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sales_data), 2) as percentual_vendas
FROM sales_data
GROUP BY DEALSIZE
ORDER BY valor_total DESC;
