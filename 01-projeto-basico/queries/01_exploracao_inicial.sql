-- =============================================
-- PROJETO 01: ANÁLISE EXPLORATÓRIA INICIAL
-- Database: portfolio_analise_vendas
-- Tabela: sales_data
-- =============================================

-- 1. VISÃO GERAL DO DATASET
SELECT 
    COUNT(*) as total_registros,
    MIN(ORDERDATE) as data_inicial,
    MAX(ORDERDATE) as data_final,
    COUNT(DISTINCT ORDERNUMBER) as total_pedidos_unicos,
    COUNT(DISTINCT PRODUCTCODE) as total_produtos_unicos,
    COUNT(DISTINCT CUSTOMERNAME) as total_clientes_unicos,
    ROUND(SUM(SALES), 2) as valor_total_vendas,
    ROUND(AVG(SALES), 2) as valor_medio_venda
FROM sales_data;

-- 2. DISTRIBUIÇÃO POR STATUS DE PEDIDO
SELECT 
    STATUS,
    COUNT(*) as quantidade_pedidos,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sales_data), 2) as percentual_total
FROM sales_data
GROUP BY STATUS
ORDER BY quantidade_pedidos DESC;

-- 3. ANÁLISE DE LINHAS DE PRODUTO
SELECT 
    PRODUCTLINE,
    COUNT(*) as total_vendas,
    COUNT(DISTINCT PRODUCTCODE) as produtos_unicos,
    ROUND(SUM(SALES), 2) as valor_total,
    ROUND(AVG(SALES), 2) as valor_medio_venda
FROM sales_data
GROUP BY PRODUCTLINE
ORDER BY valor_total DESC;

-- 4. DISTRIBUIÇÃO GEOGRÁFICA
SELECT 
    COUNTRY,
    COUNT(DISTINCT CUSTOMERNAME) as total_clientes,
    COUNT(*) as total_vendas,
    ROUND(SUM(SALES), 2) as valor_total
FROM sales_data
GROUP BY COUNTRY
ORDER BY valor_total DESC;

-- 5. ANÁLISE DE SAZONALIDADE
SELECT 
    YEAR_ID as ano,
    MONTH_ID as mes,
    COUNT(*) as total_vendas,
    ROUND(SUM(SALES), 2) as valor_total
FROM sales_data
GROUP BY ano, mes
ORDER BY ano, mes;
