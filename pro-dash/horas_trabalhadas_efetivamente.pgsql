SELECT 
id,
idusuario,
idcaixa,
idpdv,
codigo,
fechado,
abertura,
EXTRACT(EPOCH FROM (fechamento - abertura))/60/60  AS tempo_hrs
FROM sessao

limit 5