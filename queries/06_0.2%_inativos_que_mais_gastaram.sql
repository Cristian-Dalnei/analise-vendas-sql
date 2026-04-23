with tabela1 as (
select
c.id_cliente, 
c.nome_cliente,
sum(it.quantidade * it.preco_venda ) as total_gasto,
max(p.data_pedido) as ultimo_pedido,
current_date - max(p.data_pedido ) as dias_off
from cliente c
inner join pedido p on c.id_cliente  = p.id_cliente
inner join item_pedido it on p.id_pedido = it.id_pedido
group by c.id_cliente, c.nome_cliente
), tabela2 as(
select 
*,
case 
	when dias_off <= 30 then 'Ativo'
	when dias_off <= 60 then 'Atencao'
	else 'Inativo'
end as status_atividade
,
percent_rank() over(order by total_gasto desc) as rank_percentual
from tabela1
)
select 
*
from tabela2
where rank_percentual  <= 0.2 and status_atividade  = 'Inativo'
