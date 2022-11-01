SELECT
date(datahoratransacao),
descricaomodalidade,
CAST (sum(valordocumento) AS float4) AS Recebidos,
CAST (count(dadostefdedicado.rede) AS int) AS Transações
FROM
dadostefdedicado
WHERE date(datahoratransacao) = CURRENT_DATE -1
GROUP BY
descricaomodalidade, date(datahoratransacao)
LIMIT 10
