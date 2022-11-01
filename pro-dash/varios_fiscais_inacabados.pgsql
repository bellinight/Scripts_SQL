SELECT 
 cupom_fiscal, 
 numero, msg_retornada, 
 dh_contingencia
 dh_emissao, 
 situacao, situacao_integracao
FROM cupom_fiscal_eletronico
ORDER BY dh_autorizacao desc
limit 1000

SELECT msg_retornada, dh_emissao ::date, 
count(situacao_integracao) AS DR, count(situacao) AS MC
FROM cupom_fiscal_eletronico
WHERE dh_emissao = date_part('month', CURRENT_DATE) ::date_timestamp
GROUP BY date(dh_emissao), msg_retornada, date_part
ORDER BY dh_emissao DESC

limit 100


SELECT msg_retornada, dh_emissao, 
count(situacao_integracao) AS DR, sum(count(situacao)) AS MC
FROM cupom_fiscal_eletronico

limit 100

