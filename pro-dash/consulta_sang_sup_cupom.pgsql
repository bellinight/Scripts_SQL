SELECT cupomfiscal.idsessao,
sum(cupomfiscal.totalliquido) 
FILTER ( WHERE DATE(cupomfiscal.dataabertura) = CURRENT_DATE -1) 
AS Valor_cupons,
sum(sangriaefetuada.valor) 
FILTER ( WHERE DATE(cupomfiscal.dataabertura) = CURRENT_DATE -1 )
AS Valor_sangria
FROM cupom_fiscal_eletronico
INNER JOIN cupomfiscal
ON cupom_fiscal_eletronico.cupom_fiscal = cupomfiscal.id
INNER JOIN sangriaefetuada
ON sangriaefetuada.idsessao = cupomfiscal.idsessao

AND cupomfiscal.cancelado = FALSE
GROUP BY cupomfiscal.idsessao
ORDER BY cupomfiscal.idsessao DESC

LIMIT 10

=============================Consulta Suprimento=====================================

SELECT 
suprimento.idsessao,
sum(suprimento.valor)

FROM suprimento

GROUP BY suprimento.idsessao
ORDER BY idsessao DESC

LIMIT 10


=============================Consulta total cupom=====================================

SELECT 
cupomfiscal.idsessao,
CAST(sum(cupomfiscal.totalliquido) AS INT)
FROM cupomfiscal
INNER JOIN sessao
ON cupomfiscal.idsessao = sessao.id
GROUP BY cupomfiscal.idsessao
ORDER BY cupomfiscal.idsessao desc
LIMIT 10

=============================Consulta Sangria=====================================
SELECT 
sangriaefetuada.idsessao,
usuario.nomereduzido,
sessao.idpdv,
CAST(sum(sangriaefetuada.valor) AS int) AS sang_efetuada
FROM sangriaefetuada
INNER JOIN sessao
ON sangriaefetuada.idsessao = sessao.id
INNER JOIN usuario
ON usuario.id = sessao.idusuario
WHERE date(sessao.abertura) = CURRENT_DATE -1
GROUP BY sangriaefetuada.idsessao, usuario.nomereduzido, sessao.idpdv
ORDER BY sangriaefetuada.idsessao DESC
LIMIT 10
==================================================================================
SELECT
*

FROM cupomfiscal


ORDER BY idsessao DESC
LIMIT  10



SELECT * FROM sessao

ORDER BY id DESC
LIMIT 10