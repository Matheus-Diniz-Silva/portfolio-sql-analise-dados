# 📈 Projeto 01: Análise de Vendas Básica

## 🎯 Objetivo
Análise inicial de um dataset de vendas para identificar tendências e métricas fundamentais de negócio, demonstrando habilidades em SQL para análise exploratória.

## 📊 Dataset
**Sample Sales Data** - Dados de vendas de produtos com informações de clientes, produtos e transações.

**Período Analisado:** 2003-2005  
**Total de Registros:** 2.823 vendas  
**Faturamento Total:** $10,032,628.85

## 🔍 Principais Descobertas

### 📈 Sazonalidade e Tendências
- **Novembro é consistentemente o mês de pico**: +81% a +96% de crescimento vs Outubro
- **Padrão sazonal previsível**: Q4 (Out-Nov-Dez) sempre forte, Q1 mais moderado
- **Crescimento orgânico**: 2005 superando anos anteriores em vários meses
- **Queda significativa em Dezembro**: -65% a -74% vs Novembro

### 💼 Estratégia de Negócios
- **Negócios Medium são a base**: 49% do faturamento com volume equilibrado
- **Large Deals super eficientes**: Apenas 5.56% das vendas geram 25% do faturamento
- **Ticket médio variável**: 
  - Small: $2,062 | Medium: $4,398 | Large: $8,294

### 🌎 Distribuição Geográfica
- 19 países atendidos
- 92 clientes únicos
- Territórios bem estabelecidos com performance consistente

## 🛠 Queries Desenvolvidas

### 1. `01_exploracao_inicial.sql`
- Visão geral do dataset
- Distribuição por status de pedido
- Análise de linhas de produto
- Distribuição geográfica
- Sazonalidade básica

### 2. `02_analise_vendas.sql`
- Top 10 produtos mais vendidos
- Métricas de performance por linha de produto
- Análise de preços vs MSRP
- Eficiência por tamanho de negócio

### 3. `03_metricas_negocio.sql`
- Ticket médio por cliente
- Top 10 clientes mais valiosos (princípio 80/20)
- Análise de retenção de clientes
- Eficiência por território
- Sazonalidade avançada com variação percentual

## 💡 Insights Estratégicos

### Recomendações de Negócio:
1. **Otimizar estoque** para picos de Novembro
2. **Focar em converter** Small → Medium deals
3. **Buscar mais Large deals** devido à alta eficiência
4. **Planejar campanhas** agressivas para Setembro-Outubro
5. **Preparar estrutura** para queda de Dezembro

### Oportunidades Identificadas:
- Crescimento consistente ano a ano
- Clientes fiéis com múltiplas compras
- Sazonalidade previsível para planejamento
- Espaço para expansão em territórios menos explorados

## 🚀 Como Executar

1. **Importe o dataset** para seu banco MySQL
2. **Execute as queries** em ordem numérica
3. **Analise os resultados** comparando com os insights aqui documentados

## 📊 Tecnologias Utilizadas
- MySQL
- SQL para análise exploratória
- Funções de agregação e janela
- Análise de tendências temporais

---

*"Dados não são apenas números, são histórias esperando para ser contadas."*
