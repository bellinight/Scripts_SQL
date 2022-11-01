SELECT msg_retornada, date(dh_emissao), 
count(situacao_integracao) AS DR, count(situacao) AS MC
FROM cupom_fiscal_eletronico
WHERE date(dh_emissao) = CURRENT_DATE -1
GROUP BY date(dh_emissao), msg_retornada
