-- 📊 Faturamento mensal
-- Objetivo: Calcular o faturamento total da loja por mês
-- Regra de negócio: faturamento = SUM(quantidade * preco_venda)
-- Observação: A data é formatada para 'YYYY-MM' para melhor visualização

with tabela_faturamento as (
select 	
date_trunc('month',p.data_pedido) as mes1,
sum(it.quantidade  * it.preco_venda ) as total_mes
from pedido p
inner join item_pedido it on p.id_pedido  = it.id_pedido 
group by mes1
)select 
to_char(mes1,'YYYY-MM') as mes,
total_mes as faturamento
from tabela_faturamento
order by mes1
