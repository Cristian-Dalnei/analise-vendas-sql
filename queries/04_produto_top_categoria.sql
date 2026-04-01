-- 🏆 Produto mais vendido por categoria
-- Objetivo: Identificar o produto com maior volume de vendas em cada categoria
-- Regra de negócio: ranking baseado na soma das quantidades vendidas
-- Observação: Utiliza RANK() para considerar empates


with quant_vendida as(
select 
p.categoria,
p.nome_produto,
sum(it.quantidade) as quant_vendida
from produto p
inner join item_pedido it on p.id_produto  = it.id_produto 
group by p.categoria, p.nome_produto
), rank_quant as(
select
categoria,
nome_produto,
quant_vendida,
rank() over (partition by categoria order by quant_vendida  desc) as posicao
from quant_vendida 
)
select 
*
from rank_quant
where posicao = 1
order by categoria
