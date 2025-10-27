# Dataset: Brazilian E-Commerce by Olist

## Descrição
Dataset completo de um e-commerce brasileiro com dados reais de vendas, clientes, produtos, vendedores e avaliações.

## Estrutura das Tabelas

### Tabelas Principais:
- **`olist_customers_dataset`** - Dados dos clientes (99k+ registros)
- **`olist_orders_dataset`** - Pedidos e status (99k+ registros)
- **`olist_order_items_dataset`** - Itens de cada pedido (112k+ registros)
- **`olist_products_dataset`** - Catálogo de produtos (32k+ registros)
- **`olist_sellers_dataset`** - Vendedores marketplace (3k+ registros)

### Tabelas de Suporte:
- **`olist_order_payments_dataset`** - Informações de pagamento
- **`olist_order_reviews_dataset`** - Avaliações dos clientes
- **`olist_geolocation_dataset`** - Dados geográficos
- **`product_category_name_translation`** - Traduções de categorias

## Modelo Relacional
CUSTOMERS → ORDERS → ORDER_ITEMS → PRODUCTS
→ ORDER_PAYMENTS
→ ORDER_REVIEWS
ORDER_ITEMS → SELLERS

text

## Estatísticas Principais
- **Período**: Set/2016 a Out/2018 (773 dias)
- **Total de clientes**: 96.478 (100% única compra)
- **Total de pedidos**: 99.441
- **Faturamento total**: R$13.4M+
- **Vendedores ativos**: 3.095
- **Produtos únicos**: 32.951

## Cobertura Geográfica
- **Estados atendidos**: 27 (todo Brasil)
- **SP**: 50% do faturamento (40.501 clientes)
- **RJ e MG**: Mercados secundários importantes

## Fonte
[Kaggle - Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

## Destaques do Dataset
- Dados reais de e-commerce brasileiro
- Múltiplas tabelas relacionadas
- Período extenso para análise temporal
- Ideal para análise de cohort e retenção
- Dados completos de logística e avaliações

## Principais Análises Possíveis
- Análise de cohort e retenção de clientes
- Performance de vendas por categoria
- Análise geográfica de mercado
- Correlação entre entregas e avaliações
- Comportamento de compra por região
