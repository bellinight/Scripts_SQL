
SELECT sum(dfvalor_venda_liquido) AS venda_diaria 
from vw_venda_diaria
where dfdata_movimento = CURRENT_DATE -3
UNION ALL
SELECT sum(dfvalor_total_cupom -dfcancelamentos - dfdescontos) AS reducao
from vw_reducaoz
where dfdata_movimento = CURRENT_DATE -2
UNION ALL
SELECT SUM(dfvalor_venda_bruta - dfvalor_desconto) AS item_cupom 
FROM vw_item_cupom_fiscal 
where dfdata_movimento = CURRENT_DATE -2 AND dfvalor_venda_bruta_cancelada = 0
 
========================================================================================================== 
   
SELECT 
sum(vw_venda_diaria.dfvalor_venda_liquido)  AS venda_diaria,
sum(vw_reducaoz.dfvalor_total_cupom - vw_reducaoz.dfcancelamentos - vw_reducaoz.dfdescontos) AS reducao,
sum(vw_item_cupom_fiscal.dfvalor_venda_bruta - vw_item_cupom_fiscal.dfvalor_desconto)
FILTER (where vw_item_cupom_fiscal.dfdata_movimento = CURRENT_DATE -2
AND vw_item_cupom_fiscal.dfvalor_venda_bruta_cancelada = 0) AS item_cupom 
FROM vw_venda_diaria, vw_reducaoz, vw_item_cupom_fiscal

limit 1

==========================================================================================================


SELECT * from itemcupomfiscal
order by idcupomfiscal desc
limit 10

SELECT * from cupomfiscal
ORDER by id desc
limit 10

SELECT sum(dfvalor_total_cupom - (dfcancelamentos + dfdescontos)) from vw_reducaoz
where dfdata_movimento = CURRENT_DATE -3

SELECT SUM(dfvalor_venda_bruta) - sum(dfvalor_desconto)
    FROM vw_item_cupom_fiscal
    WHERE dfdata_movimento = CURRENT_DATE -3
    AND dfvalor_venda_bruta_cancelada = 0

SELECT SUM(dfvalor_venda_bruta - dfvalor_desconto)
FILTER ( WHERE dfdata_movimento = CURRENT_DATE -2
    AND dfvalor_venda_bruta_cancelada = 0 ) AS item_cupom 
    FROM vw_item_cupom_fiscal 


SELECT sum(itemcupomfiscal.totalliquido)
FROM itemcupomfiscal
    INNER JOIN cupomfiscal
    ON itemcupomfiscal.id = cupomfiscal.id
WHERE date(cupomfiscal.dataabertura) = CURRENT_DATE -2
    GROUP by date(cupomfiscal.dataabertura)