SELECT dfdata_movimento, sum(dfvalor_venda_liquido) ::float4 
AS Total_Venda
FROM vw_venda_diaria 
WHERE dfdata_movimento = CURRENT_DATE -2
GROUP BY dfdata_movimento
Limit 1


SELECT dfdata_movimento, sum(dfvalor_liquido_vendido_item) ::float4 AS Total_itens 
FROM vw_resumo_venda_itens
WHERE dfmotivo_cancelamento_cupom IS NULL
GROUP BY dfdata_movimento
ORDER BY dfdata_movimento desc

Limit 1


SELECT dfdata_movimento, sum(dfvalor_total_cupom - (dfdescontos+dfcancelamentos)) ::float4 
FROM vw_reducaoz
GROUP BY dfdata_movimento
ORDER BY dfdata_movimento desc
Limit 1


SELECT sum(dfvalor_venda_liquido) ::float4 AS Total_Venda,
sum(dfvalor_liquido_vendido_item) ::float4 AS Total_itens,
sum(dfvalor_total_cupom - (dfdescontos+dfcancelamentos)) ::float4 AS ReduçaoZ
FROM vw_reducaoz
INNER JOIN vw_venda_diaria
ON vw_reducaoz.dfdata_movimento = vw_venda_diaria.dfdata_movimento
INNER JOIN vw_resumo_venda_itens
ON vw_reducaoz.dfdata_movimento = vw_resumo_venda_itens.dfdata_movimento
WHERE vw_venda_diaria.dfdata_movimento = CURRENT_DATE -2
GROUP BY vw_reducaoz.dfdata_movimento, vw_resumo_venda_itens.dfdata_movimento, vw_venda_diaria.dfdata_movimento
ORDER BY vw_reducaoz.dfdata_movimento desc

limit 2