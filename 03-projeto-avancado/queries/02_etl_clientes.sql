-- =============================================
-- PROJETO 03: PROCESSOS ETL COM SQL  
-- Query 2: ETL para Dimensão Clientes
-- =============================================

-- 1. LIMPAR TABELA EXISTENTE (se necessário)
-- TRUNCATE TABLE dim_clientes;

-- 2. PROCESSO ETL: EXTRAIR, TRANSFORMAR E CARREGAR DADOS DE CLIENTES
INSERT INTO data_mart_olist.dim_clientes (
    cliente_id,
    estado, 
    cidade,
    cep,
    data_cadastro
)
SELECT 
    -- EXTRAÇÃO: Selecionar dados brutos
    c.customer_id as cliente_id,
    c.customer_state as estado,
    c.customer_city as cidade,
    c.customer_zip_code_prefix as cep,
    
    -- TRANSFORMAÇÃO: Criar data de cadastro a partir do primeiro pedido
    (
        SELECT MIN(DATE(o.order_purchase_timestamp))
        FROM portfolio_ecommerce.olist_orders_dataset o
        WHERE o.customer_id = c.customer_id
    ) as data_cadastro

-- FONTE DE DADOS BRUTOS
FROM portfolio_ecommerce.olist_customers_dataset c

-- CARGA: Inserir na tabela dimensional
WHERE c.customer_id IS NOT NULL;

-- 3. VALIDAÇÃO DO PROCESSO ETL
-- Verificar total de registros carregados
SELECT 
    'dim_clientes' as tabela,
    COUNT(*) as total_registros,
    COUNT(DISTINCT cliente_id) as clientes_unicos,
    COUNT(DISTINCT estado) as estados_ativos
FROM data_mart_olist.dim_clientes;

-- 4. ANÁLISE DA QUALIDADE DOS DADOS
SELECT 
    estado,
    COUNT(*) as total_clientes,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM data_mart_olist.dim_clientes), 2) as percentual
FROM data_mart_olist.dim_clientes
GROUP BY estado
ORDER BY total_clientes DESC
LIMIT 10;

-- 5. VERIFICAR DADOS NULOS OU INVÁLIDOS
SELECT 
    SUM(CASE WHEN cliente_id IS NULL THEN 1 ELSE 0 END) as clientes_sem_id,
    SUM(CASE WHEN estado IS NULL THEN 1 ELSE 0 END) as clientes_sem_estado,
    SUM(CASE WHEN data_cadastro IS NULL THEN 1 ELSE 0 END) as clientes_sem_data_cadastro
FROM data_mart_olist.dim_clientes;
