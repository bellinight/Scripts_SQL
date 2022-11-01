SELECT usuario.nomereduzido, sessao.idusuario, sessao.fechamento, cupomfiscal.idsessao, 
cupomfiscal.codigo, cupomfiscal.fechado, totalizado, serieecf, sum(totalliquido) AS Total_Sessao
FROM cupomfiscal
INNER JOIN sessao
ON cupomfiscal.id = sessao.id
INNER JOIN usuario
ON usuario.id = sessao.idusuario
GROUP BY usuario.nomereduzido, sessao.idusuario, sessao.abertura, cupomfiscal.idsessao, cupomfiscal.idsessao, 
cupomfiscal.codigo, cupomfiscal.fechado, totalizado, serieecf, sessao.fechamento
ORDER BY sessao.fechamento DESC
limit 100


