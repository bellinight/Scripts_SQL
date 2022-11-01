SELECT 
dh_emissao,
serieecf,
totalliquido,
troco,
desconto,
frete,
total_tributos,
situacao,
url_qrcode
FROM cupom_fiscal_eletronico
INNER JOIN cupomfiscal
ON cupom_fiscal_eletronico.cupom_fiscal = cupomfiscal.id

limit 10


SELECT *  from cupom_fiscal_eletronico
ORDER BY dh_emissao desc
LIMIT 10



SELECT * from cupomfiscal
ORDER BY dataabertura desc
Limit 10