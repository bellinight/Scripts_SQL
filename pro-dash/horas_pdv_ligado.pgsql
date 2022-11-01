SELECT 
sessao.idpdv,

sum(EXTRACT(EPOCH FROM (fechamento - abertura))/60/60) ::float4  AS tempo_hrs
FROM sessao
INNER JOIN usuario
ON idusuario = usuario.id
WHERE date(abertura) = CURRENT_DATE -1
GROUP BY sessao.idpdv, 

sessao.idpdv

limit 50