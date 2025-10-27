# Projeto 02: Análise de E-commerce Complexa

## Objetivo
Análise avançada de um e-commerce brasileiro com múltiplas tabelas relacionadas, demonstrando habilidades em SQL intermediário-avançado e identificação de insights estratégicos de negócio.

## Dataset
**Brazilian E-Commerce Dataset by Olist**
- **Período**: Set/2016 a Out/2018 (773 dias)
- **9 tabelas relacionadas**
- **96.478 clientes únicos**
- **R$13.4M+** em vendas analisadas
- **2.823** produtos diferentes
- **3.095** vendedores no marketplace

## Principais Descobertas

### DIAGNÓSTICO CRÍTICO: PROBLEMA DE RETENÇÃO
- **0% de retenção de clientes** - todos os 96.478 clientes fizeram apenas 1 compra
- **Empresa 100% dependente** de aquisição de novos clientes
- **Oportunidade perdida** em receita recorrente estimada em milhões
- **Crescimento baseado apenas** em novos clientes, sem fidelização

### PERFORMANCE COMERCIAL
- **Crescimento consistente** de base de clientes (1 → 7.289 clientes/mês)
- **Pico em Nov/2017**: 7.289 novos clientes (Black Friday)
- **SP domina faturamento**: 50% das vendas (R$5M+) com 40.501 clientes
- **RJ e MG** seguem como mercados secundários importantes

### COMPORTAMENTO DE GASTO
- **Ticket médio variável**: R$125 (SP) até R$217 (PB)
- **Estados menores = tickets maiores**: PB (R$217), AL (R$198), AC (R$199)
- **Clientes high-ticket**: Compram 1x (R$4K-13K) e não retornam
- **Categoria Beleza & Saúde**: Produtos mais lucrativos (R$63K em vendas)

### PERFORMANCE DE ENTREGAS
- **Nota média de satisfação**: 4.09/5 ⭐
- **Satisfação geral**: 74.81% (notas 4-5)
- **Insatisfação**: 14.81% (notas 1-2)
- **Entregas no prazo**: Análise por estado disponível

## Habilidades Demonstradas
- **CTEs (Common Table Expressions)**
- **Múltiplos JOINs complexos** entre 9 tabelas
- **Funções de Janela (Window Functions)**
- **Análise de Cohort e Retenção**
- **Subqueries Correlacionadas**
- **Análise Geográfica Avançada**
- **Análise Temporal com Sazonalidade**
- **Métricas de Satisfação e Performance**

## Queries Desenvolvidas

### 1. `01_modelagem_dados.sql`
- Análise da estrutura e relacionamentos entre tabelas
- Verificação de chaves primárias e estrangeiras
- Período temporal dos dados (773 dias de operação)
- Contagem de registros por tabela

### 2. `02_analise_vendas.sql`
- Evolução mensal de vendas e crescimento
- Performance por categoria de produto
- Top 10 produtos mais vendidos (valor e quantidade)
- Top 10 vendedores mais eficientes
- Análise de preços vs MSRP

### 3. `03_analise_clientes.sql` → **INSIGHT PRINCIPAL**
- **Análise de cohort** (retenção zero identificada)
- Clientes mais valiosos (Lifetime Value)
- Comportamento geográfico por estado
- Estatísticas de recorrência (100% única compra)
- Distribuição geográfica de clientes e receita

### 4. `04_analise_entregas.sql`
- Performance de entrega por estado
- Correlação entre tempo de entrega e avaliações
- Análise de avaliações por categoria de produto
- Top e Bottom vendedores por satisfação
- Métricas gerais de satisfação do cliente

## Recomendações Estratégicas

### PRIORIDADE MÁXIMA: PROGRAMA DE FIDELIDADE
1. **Criar programa de pontos** e recompensas para segunda compra
2. **Campanhas de remarketing** pós-30 dias para clientes inativos
3. **Ofertas exclusivas** para "clientes perdidos" de alto valor
4. **Clube VIP** para clientes high-ticket (R$4K+)

### METAS DE CURTO PRAZO
- **3 meses**: 5% de retenção no mês 2
- **6 meses**: 10% de clientes com 2+ compras
- **1 ano**: 15% de repeat rate

### OTIMIZAÇÕES OPERACIONAIS
- **Focar em estados** com alto ticket médio (PB, AL, AC)
- **Expandir categorias** de Beleza & Saúde (alto faturamento)
- **Melhorar comunicação** pós-venda para aumentar retenção

## Insights Técnicos da Análise

### Modelo Relacional Dominado
```sql
CUSTOMERS → ORDERS → ORDER_ITEMS → PRODUCTS
                    → ORDER_PAYMENTS  
                    → ORDER_REVIEWS
ORDER_ITEMS → SELLERS
