SELECT 
   conferencia_caixa.id_sessao idcaixa, 
    nomereduzido, 
    abertura, 
    fechamento, 
    valor_apurado,
    valor_informado, diferenca, fechado,
    id_sessao, 
    (valor_apurado - diferenca) AS tab_ok
FROM conferencia_caixa
INNER JOIN sessao ON conferencia_caixa.id_sessao = sessao.id
INNER JOIN usuario ON sessao.idusuario = usuario.id
WHERE date(abertura) = CURRENT_DATE -1
ORDER BY fechamento desc
Limit 100