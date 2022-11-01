SELECT
cupomfiscal.serieecf,
cupomfiscal.ccf,
cupomfiscal.dataabertura,
cupomfiscal.fechado,
cupomfiscal.cancelado,
cupomfiscal.desconto,
cupomfiscal.totalliquido,
cupomfiscal.troco,
retorno_sefaz.codigo_status, 
retorno_sefaz.descricao_status
FROM cupomfiscal
INNER JOIN retorno_sefaz
ON cupomfiscal.ccf = retorno_sefaz.numero_cupom
ORDER BY dataabertura desc

limit 10

=================================Auditor Atual=====================================


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
cupomfiscal.troco,
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
url_qrcode,
cupom_fiscal_eletronico.xml_gerado 
FROM cupom_fiscal_eletronico
INNER JOIN
cupomfiscal
ON cupom_fiscal_eletronico.cupom_fiscal = cupomfiscal.id
WHERE cupomfiscal.dataabertura  BETWEEN (CURRENT_DATE-11) and CURRENT_DATE



===================================================================================


SELECT
 *
FROM cupom_fiscal_eletronico

ORDER BY dh_emissao desc

limit 10


SELECT
 *
FROM cupomfiscal

ORDER BY dataabertura desc

limit 10