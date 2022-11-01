SELECT sum(vw_venda_diaria.dfvalor_venda_liquido + 0) from vw_venda_diaria
where dfdata_movimento = CURRENT_DATE -3
UNION ALL
SELECT sum(cupomfiscal.totalliquido) 
FROM cupomfiscal
WHERE cupomfiscal.cancelado = FALSE 
AND date(cupomfiscal.dataabertura) = CURRENT_DATE -3
UNION ALL
SELECT sum(totalliquido) FROM cupomfiscal
WHERE DATE(dataabertura) = CURRENT_DATE -3 AND cancelado = FALSE
UNION ALL
SELECT sum(vw_reducaoz.dfvalor_total_cupom - (dfcancelamentos + dfdescontos)) AS Close
from vw_reducaoz
where dfdata_movimento = CURRENT_DATE -3





SELECT
sum(vw_venda_diaria.dfvalor_venda_liquido + 0) AS Venda_liquida_loja,
sum(cupomfiscal.totalliquido) AS Cupom_fiscal_valor,
sum(vw_reducaoz.dfvalor_total_cupom - (dfcancelamentos + dfdescontos)) AS Close
FROM
vw_venda_diaria
INNER JOIN
vw_reducaoz
ON vw_venda_diaria.dfdata_movimento = vw_reducaoz.dfdata_movimento
INNER JOIN
cupomfiscal
ON vw_venda_diaria.dfdata_movimento = cupomfiscal.datafechamento
WHERE  cupomfiscal.cancelado = FALSE AND vw_reducaoz.dfdata_movimento = CURRENT_DATE -4
GROUP BY cupomfiscal.datafechamento

Limit 5
