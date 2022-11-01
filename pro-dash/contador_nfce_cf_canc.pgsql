####SELECT-REAL-DO-SITE#####
SELECT 
count(cupomfiscal.modelo_documento_fiscal)
 FILTER (WHERE cupomfiscal.modelo_documento_fiscal = 55 
 AND date(cupomfiscal.dataabertura) = CURRENT_DATE -1
 AND cupomfiscal.cancelado = TRUE ) AS MOD55,
count(cupomfiscal.modelo_documento_fiscal)
 FILTER (WHERE cupomfiscal.modelo_documento_fiscal = 65
  AND date(cupomfiscal.dataabertura) = CURRENT_DATE -1
  AND cupomfiscal.cancelado = FALSE) AS MOD65,
count(cupom_fiscal_eletronico.dh_emissao)
 FILTER (WHERE date(cupomfiscal.dataabertura) = CURRENT_DATE -1
 AND cupomfiscal.cancelado = FALSE) AS NFCE,
count(cupomfiscal.dataabertura)
 FILTER (WHERE date(cupomfiscal.dataabertura) = CURRENT_DATE -1
 AND cupomfiscal.cancelado = FALSE) AS CF,
count(cupom_fiscal_eletronico.dh_emissao) 
 FILTER (WHERE cupomfiscal.cancelado = TRUE
 AND date(cupomfiscal.dataabertura) = CURRENT_DATE -1) AS CANC 
FROM
cupomfiscal
INNER JOIN cupom_fiscal_eletronico
ON cupomfiscal.id = cupom_fiscal_eletronico.cupom_fiscal

limit 10

####CONTA-NOTAS-CUPOM######
SELECT count(dataabertura)  FROM cupomfiscal
WHERE date(dataabertura) = CURRENT_DATE -1 AND cancelado = FALSE
LIMIT 10

####CONTA-CANCELADOS-CUPOM######
SELECT count(dataabertura)  FROM cupomfiscal
WHERE date(dataabertura) = CURRENT_DATE -1 AND cancelado = TRUE
LIMIT 10

####CONTA-NOTAS-CUPOM-ELETRONICO######
SELECT count(dh_emissao) FROM cupom_fiscal_eletronico
WHERE date(dh_emissao) = CURRENT_DATE -1
LIMIT 10

SELECT 
count(cupomfiscal.modelo_documento_fiscal) 
FILTER ( WHERE cupomfiscal.modelo_documento_fiscal = 55  ) AS MOD55
FROM cupomfiscal

LIMIT 10