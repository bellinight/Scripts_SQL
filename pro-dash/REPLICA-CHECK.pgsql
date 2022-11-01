
SELECT *
from replica.cupomfiscal  
 WHERE cupomfiscal.datamovimento 
 BETWEEN CURRENT_DATE -10 AND CURRENT_DATE  

GROUP BY cupomfiscal.datamovimento
ORDER BY cupomfiscal.datamovimento desc
limit 10

SELECT 
  replica.cupomfiscal.datamovimento,
  count(replica.cupomfiscal.id_registro) FILTER (WHERE replica.cupomfiscal.cancelado = FALSE) AS OK,
  count(replica.cupomfiscal.id_registro) FILTER (WHERE replica.cupomfiscal.cancelado = TRUE) AS Canc
from replica.cupomfiscal

GROUP BY cupomfiscal.datamovimento