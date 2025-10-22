-- =============================================
-- PROJETO 01: MÉTRICAS DE NEGÓCIO
-- Query 3: Métricas Estratégicas para Tomada de Decisão
-- =============================================

-- 1. TICKET MÉDIO POR CLIENTE
SELECT 
    CUSTOMERNAME,
    COUNT(DISTINCT ORDERNUMBER) as total_pedidos,
    ROUND(SUM(SALES), 2) as valor_total_gasto,
    ROUND(SUM(SALES) / COUNT(DISTINCT ORDERNUMBER), 2) as ticket_medio_por_pedido
FROM sales_data
GROUP BY CUSTOMERNAME
ORDER BY valor_total_gasto DESC
LIMIT 10;

-- 2. TOP 10 CLIENTES MAIS VALIOSOS (80/20)
SELECT 
    CUSTOMERNAME,
    COUNTRY,
    ROUND(SUM(SALES), 2) as valor_total_compras,
    COUNT(DISTINCT ORDERNUMBER) as total_pedidos,
    ROUND(SUM(SALES) * 100.0 / (SELECT SUM(SALES) FROM sales_data), 2) as percentual_faturamento_total
FROM sales_data
GROUP BY CUSTOMERNAME, COUNTRY
ORDER BY valor_total_compras DESC
LIMIT 10;

-- 3. ANÁLISE DE RETENÇÃO DE CLIENTES
-- Clientes com múltiplas compras ao longo do tempo
SELECT 
    CUSTOMERNAME,
    COUNT(DISTINCT ORDERNUMBER) as total_pedidos,
    MIN(ORDERDATE) as primeira_compra,
    MAX(ORDERDATE) as ultima_compra,
    ROUND(SUM(SALES), 2) as lifetime_value
FROM sales_data
GROUP BY CUSTOMERNAME
HAVING total_pedidos > 1
ORDER BY total_pedidos DESC
LIMIT 15;

-- 4. EFICIÊNCIA POR TERITÓRIO/REGIÃO
SELECT 
    TERRITORY,
    COUNT(DISTINCT CUSTOMERNAME) as total_clientes,
    COUNT(*) as total_vendas,
    ROUND(SUM(SALES), 2) as valor_total,
    ROUND(SUM(SALES) / COUNT(DISTINCT CUSTOMERNAME), 2) as valor_por_cliente
FROM sales_data
WHERE TERRITORY IS NOT NULL AND TERRITORY != ''
GROUP BY TERRITORY
ORDER BY valor_total DESC;

-- 5. MÉTRICA DE SAZONALIDADE AVANÇADA
-- Comparação mês atual vs mês anterior
SELECT 
    YEAR_ID as ano,
    MONTH_ID as mes,
    ROUND(SUM(SALES), 2) as valor_mes_atual,
    LAG(ROUND(SUM(SALES), 2)) OVER (ORDER BY YEAR_ID, MONTH_ID) as valor_mes_anterior,
    ROUND(
        ((SUM(SALES) - LAG(SUM(SALES)) OVER (ORDER BY YEAR_ID, MONTH_ID)) 
        / LAG(SUM(SALES)) OVER (ORDER BY YEAR_ID, MONTH_ID)) * 100, 2
    ) as variacao_percentual
FROM sales_data
GROUP BY ano, mes
ORDER BY ano, mes;
