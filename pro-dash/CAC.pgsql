SELECT dfnumero_caixa, dfdata_movimento,
(dfcupom_final-dfcupom_inicial) as Clientes,
(dfdescontos/(dfcupom_final-dfcupom_inicial)) as CAC,
(dfvalor_total_cupom-(dfcancelamentos+dfdescontos)) as v_liquido,
(dfvalor_total_cupom / (dfcupom_final-dfcupom_inicial)) AS gasto_medio
FROM vw_reducaoz
where dfdata_movimento = CURRENT_DATE -2


###CAC####
SELECT dfnumero_caixa, dfdescontos,
(dfcupom_final-dfcupom_inicial) as Clientes,
(dfdescontos/(dfcupom_final-dfcupom_inicial)) as CAC,
(dfvalor_total_cupom-(dfcancelamentos+dfdescontos)) as v_liquido,
(dfdescontos / (dfcupom_final-dfcupom_inicial)) AS Desc_PC,
(dfvalor_total_cupom / (dfcupom_final-dfcupom_inicial) - (dfdescontos / (dfcupom_final-dfcupom_inicial))) AS gasto_medio
FROM vw_reducaoz
where dfdata_movimento = CURRENT_DATE -5

