SELECT 
cupomfiscal.codigo,
cupomfiscal.dataabertura,
cupomfiscal.datafechamento,
cupomfiscal.cancelado,
cupomfiscal.fechado,
cupomfiscal.coo,
cupomfiscal.desconto,
cupomfiscal.serieecf,
cupomfiscal.ccf,
cupomfiscal.acrescimo,
cupomfiscal.totalliquido,
cupomfiscal.idcliente,
cupomfiscal.id,
cupomfiscal.totalizado,
cupom_fiscal_eletronico.dh_emissao, 
cupom_fiscal_eletronico.dh_autorizacao, 
cupom_fiscal_eletronico.serie, 
cupom_fiscal_eletronico.cupom_fiscal, 
cupom_fiscal_eletronico.numero,
cupom_fiscal_eletronico.situacao,
cupom_fiscal_eletronico.msg_retornada, 
EXTRACT(EPOCH FROM (dh_emissao - dh_autorizacao)) as diferenca_hora, 
url_qrcode 
FROM cupom_fiscal_eletronico
INNER JOIN
cupomfiscal
ON cupom_fiscal_eletronico.cupom_fiscal = cupomfiscal.id

Limit 10

