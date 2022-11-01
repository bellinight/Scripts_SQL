SELECT 
 pdv.descricao,
 usuario.nomereduzido, 
 date(abertura) AS Data_falta
FROM sessao
INNER JOIN usuario
ON usuario.id = sessao.idusuario
INNER JOIN pdv
ON sessao.idpdv = pdv.idperfilpdv
WHERE fechado = 'FALSE' AND pdv.desativado ISNULL
ORDER BY abertura DESC
LIMIT 10
