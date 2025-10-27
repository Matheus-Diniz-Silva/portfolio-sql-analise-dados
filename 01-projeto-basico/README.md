# Projeto 01: Análise de Vendas Básica

## Objetivo
Análise inicial de um dataset de vendas para identificar tendências e métricas fundamentais de negócio, demonstrando habilidades fundamentais em SQL para análise exploratória.

## Dataset
**Sample Sales Data** - Dados de vendas de produtos com informações de clientes, produtos e transações.

- **Período Analisado**: 2003-2005
- **Total de Registros**: 2.823 vendas
- **Faturamento Total**: $10,032,628.85
- **Clientes Únicos**: 92
- **Países Atendidos**: 19

*Para detalhes completos do dataset, consulte [data/dataset_info.md](./data/dataset_info.md)*

## Principais Descobertas

### Sazonalidade e Tendências
- **Novembro é o mês de pico**: +81% a +96% de crescimento vs Outubro
- **Padrão sazonal previsível**: Q4 (Out-Nov-Dez) sempre forte, Q1 mais moderado
- **Crescimento orgânico**: 2005 superando anos anteriores em vários meses
- **Queda significativa em Dezembro**: -65% a -74% vs Novembro

### Estratégia de Negócios
- **Negócios Medium são a base**: 49% do faturamento com volume equilibrado
- **Large Deals super eficientes**: Apenas 5.56% das vendas geram 25% do faturamento
- **Ticket médio variável**: Small: $2,062 | Medium: $4,398 | Large: $8,294

### Distribuição Geográfica
- 19 países atendidos
- 92 clientes únicos
- Presença global consolidada

## Habilidades Demonstradas
- **Consultas SQL básicas**: SELECT, WHERE, ORDER BY, GROUP BY
- **Junções e Agregações**: COUNT, SUM, AVG, MIN, MAX
- **Análise Temporal**: Tendências e sazonalidade
- **Análise para Negócios**: Criação de métricas e KPIs

## Estrutura do Projeto

### data/
- **dataset_info.md** - Metadados completos do dataset

### queries/
- **01_exploracao_inicial.sql** - Análise exploratória e visão geral
- **02_analise_vendas.sql** - Performance comercial e métricas
- **03_metricas_negocio.sql** - Métricas estratégicas de negócio

## Análise Temporal Implementada
- Agrupamento por ano e mês para análise de sazonalidade
- Cálculo de variação percentual mês a mês
- Identificação de padrões de crescimento

## Recomendações Estratégicas

### Otimização de Operações
1. **Otimizar estoque** para picos de Novembro
2. **Focar em converter** Small para Medium deals
3. **Buscar mais Large deals** devido à alta eficiência
4. **Planejar campanhas** agressivas para Setembro-Outubro

### Metas de Desempenho
- **Crescimento**: Manter tendência positiva observada em 2005
- **Eficiência**: Aumentar participação de Large deals
- **Expansão**: Explorar mercados com menor penetração

## Como Executar
1. **Importe o dataset** para seu banco MySQL
2. **Consulte os metadados** em data/dataset_info.md
3. **Execute as queries** em ordem numérica
4. **Analise os resultados** comparando com os insights documentados

## Impacto do Projeto
Esta análise demonstrou como SQL básico pode gerar insights valiosos para tomada de decisão estratégica. A identificação de padrões de sazonalidade e a análise de eficiência por tamanho de negócio fornecem bases sólidas para otimização operacional e planejamento comercial.

---

"Dados não são apenas números, são histórias esperando para ser contadas."

---
**Tecnologias**: MySQL, SQL Básico, Análise de Negócios  
**Repositório**: [GitHub - Portfolio SQL](https://github.com/Matheus-Diniz-Silva/portfolio-sql-analise-dados)
