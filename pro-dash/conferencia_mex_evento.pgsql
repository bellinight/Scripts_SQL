SELECT * FROM cupomfiscal
INNER JOIN mex_evento
ON cupomfiscal.ID = mex_evento.id_objeto
ORDER BY cupomfiscal.dataabertura DESC
LIMIT 31


SELECT * FROM cupom_fiscal_eletronico
WHERE cupom_fiscal = '695091'
LIMIT 10



SELECT * FROM
cupomfiscal
WHERE date(dataabertura) = '2022-06-09' AND serieecf ='NFCE07'
AND ID = '695091'
ORDER BY dataabertura DESC
LIMIT 200




SELECT * FROM
reducaoz
ORDER BY dataemissao DESC
LIMIT 10