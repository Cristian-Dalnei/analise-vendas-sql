📌 Descrição do Projeto

Projeto de análise de dados utilizando SQL com foco em métricas de vendas, comportamento de clientes e performance de produtos.

O objetivo é transformar dados brutos em informações úteis para tomada de decisão.

🛠️ Tecnologias Utilizadas
PostgreSQL
SQL

🗄️ Estrutura do Banco de Dados

📍 Tabela: estado
id_estado (PK)
sigla

📍 Tabela: cliente
id_cliente (PK)
id_estado (FK)
nome_cliente
sexo
nascimento

📍 Tabela: pedido
id_pedido (PK)
id_cliente (FK)
data_pedido

📍 Tabela: produto
id_produto (PK)
nome_produto
preco
categoria

📍 Tabela: item_pedido
id_item_pedido (PK)
id_pedido (FK)
id_produto (FK)
preco_venda
quantidade

📊 Métricas Analisadas
Faturamento mensal
Ticket médio por mês
Clientes recorrentes
Top 3 clientes por mês
Produtos mais vendidos por categoria
Faturamento acumulado
