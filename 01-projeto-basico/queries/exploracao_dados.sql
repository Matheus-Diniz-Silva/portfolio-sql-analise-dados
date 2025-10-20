-- Análise Exploratória de Dados de Vendas
-- Demonstração: Filtros, agregações e ordenação

-- 1. Total de vendas por produto
SELECT 
    produto,
    SUM(valor_venda) as total_vendas,
    COUNT(*) as quantidade_vendas
FROM vendas
GROUP BY produto
ORDER BY total_vendas DESC;

-- 2. Vendas por mês
SELECT 
    EXTRACT(MONTH FROM data_venda) as mes,
    SUM(valor_venda) as total_mensal
FROM vendas
GROUP BY mes
ORDER BY mes;
