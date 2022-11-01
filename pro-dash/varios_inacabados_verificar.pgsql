SELECT * FROM
formapagamentoefetuada

ORDER BY idsessao DESC

LIMIT 10

SELECT 
formapagamentoefetuada.idsessao,
sum(formapagamentoefetuada.valor) 
FILTER (WHERE formapagamentoefetuada.idforma = '1') ::float4 AS dindin,

FROM formapagamentoefetuada
INNER JOIN sangriaefetuada
ON sangriaefetuada.idsessao = formapagamentoefetuada.idsessao
WHERE sangriaefetuada.idsessao = '1153'
GROUP BY formapagamentoefetuada.idsessao, sangriaefetuada.valor
ORDER BY idsessao DESC
LIMIT 100


sum(formapagamentoefetuada.valor) 
FILTER (WHERE formapagamentoefetuada.idforma = '4') AS form4,
sum(formapagamentoefetuada.valor) 
FILTER (WHERE formapagamentoefetuada.idforma = '3') AS form3,



SELECT 
sessao.idpdv,
usuario.nomereduzido,
sum(formapagamentoefetuada.valor) 
FILTER (WHERE formapagamentoefetuada.idforma = '1') ::FLOAT AS dindin
FROM sangriaefetuada
INNER JOIN sessao
ON sangriaefetuada.idsessao = sessao.id
INNER JOIN formapagamentoefetuada
ON formapagamentoefetuada.idsessao = sessao.id
INNER JOIN usuario
ON usuario.id = sessao.idusuario
WHERE date(sessao.abertura) = CURRENT_DATE -1
AND date(sessao.fechamento) ISNULL
GROUP BY  sessao.idpdv, sessao.id, usuario.nomereduzido
ORDER BY sessao.id DESC
LIMIT 10