-- =============================================
-- ANÁLISE EXPLORATÓRIA INICIAL - SAMPLE SALES DATA
-- Objetivo: Entender a estrutura e qualidade dos dados
-- Tabela: sales_data_sample
-- =============================================

-- 1. VISÃO GERAL DO DATASET
-- Total de registros, intervalos de data e métricas básicas
SELECT 
    COUNT(*) as total_registros,
    MIN(STR_TO_DATE(ORDERDATE, '%m/%d/%Y %H:%i')) as data_inicial,
    MAX(STR_TO_DATE(ORDERDATE, '%m/%d/%Y %H:%i')) as data_final,
    COUNT(DISTINCT ORDERNUMBER) as total_pedidos_unicos,
    COUNT(DISTINCT PRODUCTCODE) as total_produtos_unicos,
    COUNT(DISTINCT CUSTOMERNAME) as total_clientes_unicos,
    ROUND(SUM(SALES), 2) as valor_total_vendas,
    ROUND(AVG(SALES), 2) as valor_medio_venda
FROM sales_data_sample;

-- 2. DISTRIBUIÇÃO POR STATUS DE PEDIDO
-- Entender a saúde do funil de vendas
SELECT 
    STATUS,
    COUNT(*) as quantidade_pedidos,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sales_data_sample), 2) as percentual_total
FROM sales_data_sample
GROUP BY STATUS
ORDER BY quantidade_pedidos DESC;

-- 3. ANÁLISE DE LINHAS DE PRODUTO
-- Verificar diversidade de produtos
SELECT 
    PRODUCTLINE,
    COUNT(*) as total_vendas,
    COUNT(DISTINCT PRODUCTCODE) as produtos_unicos,
    ROUND(SUM(SALES), 2) as valor_total,
    ROUND(AVG(SALES), 2) as valor_medio_venda
FROM sales_data_sample
GROUP BY PRODUCTLINE
ORDER BY valor_total DESC;

-- 4. DISTRIBUIÇÃO GEOGRÁFICA
-- Clientes por país
SELECT 
    COUNTRY,
    COUNT(DISTINCT CUSTOMERNAME) as total_clientes,
    COUNT(*) as total_vendas,
    ROUND(SUM(SALES), 2) as valor_total
FROM sales_data_sample
GROUP BY COUNTRY
ORDER BY valor_total DESC;

-- 5. ANÁLISE DE SAZONALIDADE BÁSICA
-- Vendas por ano e mês (usando as colunas YEAR_ID e MONTH_ID)
SELECT 
    YEAR_ID as ano,
    MONTH_ID as mes,
    COUNT(*) as total_vendas,
    ROUND(SUM(SALES), 2) as valor_total
FROM sales_data_sample
GROUP BY ano, mes
ORDER BY ano, mes;
