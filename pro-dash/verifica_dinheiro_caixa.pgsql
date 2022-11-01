SELECT     
    sangriaefetuada.idsessao,
    formapagamentoefetuada.idsessao,
    date(sangriaefetuada.datahoraemissao),
    sum(formapagamentoefetuada.valor) 
        FILTER (WHERE formapagamentoefetuada.idforma = '1') AS dindin,
    sangriaefetuada.valor
FROM
    sessao
INNER JOIN sangriaefetuada
    ON sangriaefetuada.idsessao = sessao.id
INNER JOIN formapagamentoefetuada
    ON formapagamentoefetuada.idsessao = sessao.id  
    WHERE sessao.fechado = 'true'
    AND date(sangriaefetuada.datahoraemissao) = CURRENT_DATE -1
    AND (sangriaefetuada.idforma = '1')
GROUP BY 
    date(sangriaefetuada.datahoraemissao),
    formapagamentoefetuada.idsessao,
    sangriaefetuada.idsessao,
    sangriaefetuada.valor






SELECT 
    sum(sangriaefetuada.valor),
    sangriaefetuada.idsessao
FROM sangriaefetuada
    WHERE (sangriaefetuada.idforma = '1')
GROUP BY sangriaefetuada.idsessao, sangriaefetuada.datahoraemissao

order by sangriaefetuada.datahoraemissao desc
limit 10


SELECT * FROM formapagamentoefetuada

order by idsessao desc
limit 10