-- =============================================
-- PROJETO 03: PROCESSOS ETL COM SQL
-- Query 1: Criação da Estrutura do Data Mart
-- =============================================

-- 1. CRIAR DATABASE PARA O DATA MART
CREATE DATABASE IF NOT EXISTS data_mart_olist;
USE data_mart_olist;

-- 2. DIMENSÃO CLIENTES
CREATE TABLE IF NOT EXISTS dim_clientes (
    cliente_id VARCHAR(100) PRIMARY KEY,
    estado VARCHAR(2),
    cidade VARCHAR(100),
    cep VARCHAR(20),
    data_cadastro DATE
);

-- 3. DIMENSÃO PRODUTOS
CREATE TABLE IF NOT EXISTS dim_produtos (
    produto_id VARCHAR(100) PRIMARY KEY,
    categoria VARCHAR(100),
    nome_produto TEXT,
    peso_gramas INT,
    altura_cm INT,
    largura_cm INT,
    comprimento_cm INT
);

-- 4. FATO VENDAS
CREATE TABLE IF NOT EXISTS fat_vendas (
    venda_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id VARCHAR(100),
    cliente_id VARCHAR(100),
    produto_id VARCHAR(100),
    vendedor_id VARCHAR(100),
    data_pedido DATE,
    data_entrega DATE,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    valor_total DECIMAL(10,2),
    frete DECIMAL(10,2),
    status_pedido VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES dim_clientes(cliente_id),
    FOREIGN KEY (produto_id) REFERENCES dim_produtos(produto_id)
);

-- 5. VISÃO GERAL DA ESTRUTURA CRIADA
SHOW TABLES;

-- 6. DESCREVER ESTRUTURA DAS TABELAS
DESCRIBE dim_clientes;
DESCRIBE dim_produtos;
DESCRIBE fat_vendas;
