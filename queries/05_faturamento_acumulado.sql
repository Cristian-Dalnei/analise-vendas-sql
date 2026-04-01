-- 📈 Faturamento acumulado mensal
-- Objetivo: Calcular o faturamento acumulado ao longo do tempo
-- Regra de negócio: acumulado = soma progressiva do faturamento mensal
-- Observação: Utiliza função de janela (SUM OVER)

with faturamento_mensal as(
select
date_trunc('month',p.data_pedido ) as mes,
sum(it.quantidade * it.preco_venda ) as faturamento
from pedido p
inner join item_pedido it on p.id_pedido  = it.id_pedido 
group by mes
)select 
to_char(mes,'YYYY-MM') as mes_formatado,
faturamento,
sum(faturamento)  over(order by mes) as faturamento_acumulado
from faturamento_mensal
order by mes
