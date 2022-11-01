SELECT 
cupomfiscal.serieecf, 
itemcupomfiscal.idcupomfiscal,
cupomfiscal.datafechamento, 
cupomfiscal.totalliquido AS TOTAL,
(sum(itemcupomfiscal.precocusto)) AS Custo,
(cupomfiscal.totalliquido) - (sum(itemcupomfiscal.precocusto)) as lucro_real,
(((cupomfiscal.totalliquido) - sum(itemcupomfiscal.precocusto)) / ((cupomfiscal.totalliquido))) * 100 as Percnt
FROM itemcupomfiscal
INNER JOIN cupomfiscal
ON itemcupomfiscal.idcupomfiscal = cupomfiscal.id
WHERE date(cupomfiscal.datafechamento) BETWEEN CURRENT_DATE -3 and CURRENT_DATE -1
AND itemcupomfiscal.cancelado = FALSE
GROUP BY cupomfiscal.datafechamento, cupomfiscal.serieecf, cupomfiscal.totalliquido,
itemcupomfiscal.idcupomfiscal

ORDER BY cupomfiscal.datafechamento desc
LIMIT 9000
