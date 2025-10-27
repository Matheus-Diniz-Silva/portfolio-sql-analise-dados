# Projeto 02: Análise de E-commerce Complexa

## Objetivo
Análise avançada de um e-commerce brasileiro com múltiplas tabelas relacionadas, demonstrando habilidades em SQL intermediário-avançado e identificação de insights estratégicos de negócio.

## Dataset
**Brazilian E-Commerce Dataset by Olist**
- Período: Set/2016 a Out/2018 (773 dias)
- 9 tabelas relacionadas
- 96.478 clientes únicos
- R$13.4M+ em vendas analisadas

## Principais Descobertas

### DIAGNÓSTICO CRÍTICO: PROBLEMA DE RETENÇÃO
- **0% de retenção de clientes** - todos os 96.478 clientes fizeram apenas 1 compra
- **Empresa 100% dependente** de aquisição de novos clientes
- **Oportunidade perdida** em receita recorrente

### PERFORMANCE COMERCIAL
- **Crescimento consistente** de base de clientes
- **Pico em Nov/2017**: 7.289 novos clientes (Black Friday)
- **SP domina faturamento**: 50% das vendas (R$5M+)

### COMPORTAMENTO DE GASTO
- **Ticket médio variável**: R$125 (SP) até R$217 (PB)
- **Estados menores = tickets maiores**: PB, AL, AC com melhores performances
- **Clientes high-ticket**: Compram 1x (R$4K-13K) e não retornam

## Habilidades Demonstradas
- CTEs (Common Table Expressions)
- Múltiplos JOINs complexos
- Funções de Janela (Window Functions)
- Análise de Cohort e Retenção
- Subqueries Correlacionadas
- Análise Geográfica Avançada

## Queries Desenvolvidas

### 1. `01_modelagem_dados.sql`
- Análise da estrutura e relacionamentos
- Verificação de chaves primárias e estrangeiras
- Período temporal dos dados

### 2. `02_analise_vendas.sql`
- Evolução mensal de vendas
- Performance por categoria de produto
- Top produtos e vendedores

### 3. `03_analise_clientes.sql`
- **Análise de cohort** (retenção zero identificada)
- Clientes mais valiosos (Lifetime Value)
- Comportamento geográfico por estado
- Estatísticas de recorrência

## Recomendações Estratégicas

### PRIORIDADE MÁXIMA: PROGRAMA DE FIDELIDADE
1. **Criar programa de pontos** e recompensas
2. **Campanhas de remarketing** pós-30 dias
3. **Ofertas exclusivas** para "clientes perdidos"
4. **Clube VIP** para clientes high-ticket (R$4K+)

### METAS DE CURTO PRAZO
- **3 meses**: 5% de retenção no mês 2
- **6 meses**: 10% de clientes com 2+ compras
- **1 ano**: 15% de repeat rate

## Impacto do Projeto
Esta análise identificou um problema estratégico crítico que impacta diretamente a sustentabilidade do negócio, demonstrando como SQL avançado pode gerar insights com impacto financeiro significativo.

---

*"Dados não são apenas números - são histórias de negócio esperando para ser contadas. Aqui, contamos a história de 96.478 oportunidades perdidas."*
