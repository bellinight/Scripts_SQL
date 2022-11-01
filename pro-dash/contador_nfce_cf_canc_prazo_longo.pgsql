SELECT 
date(cupom_fiscal_eletronico.dh_emissao),
count(cupomfiscal.modelo_documento_fiscal)
 FILTER (WHERE cupomfiscal.modelo_documento_fiscal = 55  
 AND cupomfiscal.cancelado = TRUE ) AS MOD55,
count(cupomfiscal.modelo_documento_fiscal)
 FILTER (WHERE cupomfiscal.modelo_documento_fiscal = 65  
  AND cupomfiscal.cancelado = FALSE) AS MOD65,
count(cupom_fiscal_eletronico.dh_emissao)
 FILTER (WHERE cupomfiscal.cancelado = FALSE) AS NFCE,
count(cupomfiscal.dataabertura)
 FILTER (WHERE  cupomfiscal.cancelado = FALSE) AS CF,
count(cupom_fiscal_eletronico.dh_emissao) 
 FILTER (WHERE cupomfiscal.cancelado = TRUE) AS CANC 
FROM
cupomfiscal
INNER JOIN cupom_fiscal_eletronico
ON cupomfiscal.id = cupom_fiscal_eletronico.cupom_fiscal
WHERE cupom_fiscal_eletronico.dh_emissao 
BETWEEN CURRENT_DATE -10 AND CURRENT_DATE
GROUP BY date(cupom_fiscal_eletronico.dh_emissao)
ORDER BY date(cupom_fiscal_eletronico.dh_emissao) desc

SELECT *
from replica.cupomfiscal  
 WHERE cupomfiscal.datamovimento 
 BETWEEN CURRENT_DATE -10 AND CURRENT_DATE  

GROUP BY cupomfiscal.datamovimento
ORDER BY cupomfiscal.datamovimento desc
limit 10

SELECT 
  cupomfiscal.datamovimento,
  count(cupomfiscal.id_registro)
from replica.cupomfiscal
WHERE replica.cupomfiscal.cancelado = FALSE
GROUP BY cupomfiscal.datamovimento