-- 📊 Ticket médio mensal
-- Objetivo: Calcular o ticket médio por mês
-- Regra de negócio: ticket médio = faturamento / total de pedidos

with faturamento_mes as(
select
date_trunc('month', p.data_pedido) as mes1,
count(distinct(p.id_pedido)) as quant_pedido,
sum(it.quantidade * it.preco_venda) as total_mes
from pedido p
inner join item_pedido it on  p.id_pedido = it.id_pedido
group by mes1
)select
to_char(mes1,'YYYY-MM') as mes,
total_mes,
quant_pedido,
round(total_mes/quant_pedido) as ticket_medio
from faturamento_mes
