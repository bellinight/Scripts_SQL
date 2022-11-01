SELECT 
serie,
min(dh_autorizacao) ::time AS Primeiro_Envio,
max(dh_autorizacao) ::time AS Ultimo_Envio,
now() ::varchar ::time As Check_Notas
FROM cupom_fiscal_eletronico
WHERE date(dh_autorizacao)  = CURRENT_DATE
AND danfe_emitido = 'TRUE'
GROUP BY serie

limit 20

