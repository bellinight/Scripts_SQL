SELECT relatorio_saida_operador.id_pdv, data_movimento ::date, 
relatorio_saida_operador.id_usuario,
usuario.nomereduzido,
relatorio_saida_operador.espelho
FROM relatorio_saida_operador
INNER JOIN usuario
ON usuario.id = relatorio_saida_operador.id_usuario
ORDER BY relatorio_saida_operador.data_movimento desc
limit 10

SELECT * from relatorio_saida_operador
limit 10