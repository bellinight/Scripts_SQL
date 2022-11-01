SELECT
sum(cupomfiscal.totalliquido) FILTER ( WHERE date(cupom_fiscal_eletronico.dh_emissao) = CURRENT_DATE -3) AS VCUPOM
FROM cupom_fiscal_eletronico
INNER JOIN cupomfiscal
ON cupom_fiscal_eletronico.cupom_fiscal = cupomfiscal.id


SELECT sum(dfvalor_total_cupom) FILTER ( WHERE dfdata_movimento = CURRENT_DATE -3 ) 
FROM vw_reducaoz


SELECT sum((vendabrutadiaria-cancelmanetos) - descontos) 
AS VREDUCAO 
FROM reducaoz
WHERE  date(datamovimento) = CURRENT_DATE -3



SELECT sum(itemcupomfiscal.totalliquido) 
FILTER ( WHERE date(cupom_fiscal_eletronico.dh_emissao) = CURRENT_DATE -9)
AS VITEM
FROM itemcupomfiscal
INNER JOIN cupom_fiscal_eletronico
ON cupom_fiscal_eletronico.cupom_fiscal = itemcupomfiscal.idcupomfiscal






SELECT date(cupom_fiscal_eletronico.dh_emissao), 
sum(itemcupomfiscal.totalliquido) 
FROM itemcupomfiscal
INNER JOIN cupom_fiscal_eletronico
ON cupom_fiscal_eletronico.cupom_fiscal = itemcupomfiscal.idcupomfiscal
WHERE date(cupom_fiscal_eletronico.dh_emissao) = CURRENT_DATE -3
GROUP BY itemcupomfiscal.idcupomfiscal, cupom_fiscal_eletronico.dh_emissao

ORDER BY idcupomfiscal desc
limit 100




limit 10

