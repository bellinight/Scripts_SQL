SELECT descricao, 
versao_sistema, 
atualizacao, ip
FROM pdv
WHERE versao_sistema 
BETWEEN '13.0.0' AND '14.0.0'
