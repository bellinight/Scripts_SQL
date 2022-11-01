SELECT cupomfiscal.modelo_documento_fiscal,
(sum(cupomfiscal.totalliquido))
FROM cupom_fiscal_eletronico
INNER JOIN cupomfiscal
ON cupom_fiscal_eletronico.cupom_fiscal = cupomfiscal.id
WHERE DATE(dataabertura) = CURRENT_DATE -2 AND cancelado = FALSE
GROUP BY cupomfiscal.modelo_documento_fiscal
ORDER BY modelo_documento_fiscal DESC
LIMIT 100
GROUP BY cupomfiscal.modelo_documento_fiscal


FILTER ( WHERE cupomfiscal.cancelado = FALSE  AND date(cupomfiscal.dataabertura) = CURRENT_DATE -1 )

SELECT sum(totalliquido), modelo_documento_fiscal FROM cupomfiscal
WHERE DATE(dataabertura) = CURRENT_DATE -1 AND cancelado = FALSE
GROUP BY cupomfiscal.modelo_documento_fiscal

SELECT sum(totalliquido)  FROM cupomfiscal
WHERE DATE(dataabertura) = CURRENT_DATE -2 AND cancelado = FALSE







SELECT count(itemcupomfiscal.quantidade) AS Itens_cupom, itemcupomfiscal.idcupomfiscal,
cupom_fiscal_eletronico.numero, 
cupom_fiscal_eletronico.dh_emissao, 
cupomfiscal.totalliquido, 
sum(itemcupomfiscal.totaldesconto) AS Total_DESC,
sum(itemcupomfiscal.totalliquido) AS Total_IT_cup,
(cupomfiscal.totalliquido - sum(itemcupomfiscal.totalliquido)) AS Diferenca_valor
FROM itemcupomfiscal
INNER JOIN cupomfiscal
ON itemcupomfiscal.idcupomfiscal = cupomfiscal.id
INNER JOIN cupom_fiscal_eletronico
ON itemcupomfiscal.idcupomfiscal = cupom_fiscal_eletronico.cupom_fiscal
WHERE date(cupom_fiscal_eletronico.dh_emissao) = CURRENT_DATE -1
AND itemcupomfiscal.cancelado = FALSE
GROUP BY cupom_fiscal_eletronico.numero, cupomfiscal.totalliquido,
cupom_fiscal_eletronico.dh_emissao, itemcupomfiscal.idcupomfiscal, cupomfiscal.id
ORDER BY cupom_fiscal_eletronico.numero desc
LIMIT 200


SELECT idcupomfiscal, sum(totalliquido) FROM itemcupomfiscal
GROUP BY idcupomfiscal

Order by idcupomfiscal desc
limit 100

SELECT * FROM itemcupomfiscal

limit 10



SELECT * FROM itemcupomfiscal
WHERE idcupomfiscal = 169127

ORDER BY idcupomfiscal DESC

limit 20

SELECT * from cupomfiscal
ORDER BY dataabertura desc
LIMIT 10

SELECT * from cupom_fiscal_eletronico
ORDER BY dh_emissao desc


limit 10