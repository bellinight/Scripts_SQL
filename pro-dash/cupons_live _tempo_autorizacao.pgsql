SELECT 
dh_emissao, 
dh_autorizacao, 
serie, 
cupom_fiscal, 
numero,
situacao,
msg_retornada, 
EXTRACT(EPOCH FROM (dh_emissao - dh_autorizacao)) as diferenca_hora, 
url_qrcode 
FROM cupom_fiscal_eletronico

limit 100


