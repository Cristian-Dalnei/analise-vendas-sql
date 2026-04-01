-- 🏆 Top 3 clientes por mês
-- Objetivo: Identificar os clientes que mais gastaram em cada mês
-- Regra de negócio: ranking baseado no total gasto 
-- Observação: Utilizo RANK() para considerar empates

with gasto_cliente as 
(select
date_trunc('month', p.data_pedido) as mes1,
c.id_cliente,
c.nome_cliente,
sum(it.quantidade  * it.preco_venda ) as total_gasto
from pedido p
inner join cliente c on p.id_cliente = c.id_cliente
inner join item_pedido it on p.id_pedido  = it.id_pedido 
group by mes1, c.id_cliente , c.nome_cliente
), rank_clientes as(
select
to_char(mes1,'YYYY-MM') as mes,
nome_cliente,
total_gasto,
rank() over(partition by mes1 order by total_gasto desc) as posicao
from gasto_cliente 
)select
*
from rank_clientes
where posicao <=3
