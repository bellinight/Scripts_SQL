select dfnumero_fabricacao, dfdata_movimento,
(dfcupom_final-dfcupom_inicial) as clientes_dia,
(dfvalor_total_cupom / (dfcupom_final-dfcupom_inicial) )
as gasto_medio,
dfvalor_total_cupom from vw_reducaoz
WHERE date(dfdata_movimento) = CURRENT_DATE -3
