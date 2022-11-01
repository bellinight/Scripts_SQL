SELECT 
    date(sangriaefetuada.datahoraemissao),
    formapagamentoefetuada.idsessao,
    (sum(formapagamentoefetuada.valor) FILTER (WHERE formapagamentoefetuada.idforma = '1' AND date(sangriaefetuada.datahoraemissao) = CURRENT_DATE -5)) AS dindin,
    (sum(sangriaefetuada.valor) FILTER (WHERE date(sangriaefetuada.datahoraemissao) = CURRENT_DATE -5)) AS sang_efetuada,
    (sum(formapagamentoefetuada.valor) FILTER (WHERE formapagamentoefetuada.idforma = '1') - (sum(sangriaefetuada.valor) FILTER (WHERE date(sangriaefetuada.datahoraemissao) = CURRENT_DATE -5)))
FROM
    formapagamentoefetuada
INNER JOIN sangriaefetuada
    ON sangriaefetuada.idsessao = formapagamentoefetuada.idsessao
    WHERE date(sangriaefetuada.datahoraemissao) = CURRENT_DATE -5
GROUP BY 
    date(sangriaefetuada.datahoraemissao),
    formapagamentoefetuada.idsessao
