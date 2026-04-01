projeto-analise-vendas/
│
├── queries/
│   ├── 01_faturamento_mensal.sql
│   ├── 02_ticket_medio.sql
│   ├── 03_clientes_recorrentes.sql
│   ├── 04_top_clientes_mes.sql
│   ├── 05_top_produtos_mes.sql
│   ├── 06_receita_acumulada.sql
│
├── README.md


Banco usado para realização dos exercícios
ESTADO
id_estado(PK)
sigla

CLIENTE
id_cliente(PK)
id_estado(FK)
nome_cliente
sexo
nascimento

PEDIDO
id_pedido(PK)
id_cliente(FK)
data_pedido

PRODUTO
id_produto(FK)
nome_produto
preco
categoria

ITEM_PEDIDO
id_item_pedido(PK)
id_pedido(FK)
id_produto(FK)
preco_venda
quantidade










