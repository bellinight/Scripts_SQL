SELECT sum(cupomfiscal.totalliquido) 
FROM cupomfiscal
WHERE cupomfiscal.cancelado = FALSE  AND date(cupomfiscal.dataabertura) = CURRENT_DATE -1
