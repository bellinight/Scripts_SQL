SELECT count(itemcupomfiscal.quantidade) AS Itens_cupom, itemcupomfiscal.idcupomfiscal,
cupom_fiscal_eletronico.serie,
cupom_fiscal_eletronico.numero, 
cupom_fiscal_eletronico.dh_emissao AS DATA_REG, 
cupomfiscal.totalliquido, 
sum(itemcupomfiscal.totaldesconto) AS Total_DESC,
sum(itemcupomfiscal.totalliquido) AS Total_IT_cup,
(cupomfiscal.totalliquido - sum(itemcupomfiscal.totalliquido)) AS Diferenca_valor,
cupom_fiscal_eletronico.msg_retornada,
cupom_fiscal_eletronico.situacao,
cupom_fiscal_eletronico.url_qrcode
FROM itemcupomfiscal
INNER JOIN cupomfiscal
ON itemcupomfiscal.idcupomfiscal = cupomfiscal.id
INNER JOIN cupom_fiscal_eletronico
ON itemcupomfiscal.idcupomfiscal = cupom_fiscal_eletronico.cupom_fiscal
WHERE itemcupomfiscal.cancelado = FALSE
AND date(cupom_fiscal_eletronico.dh_emissao) = CURRENT_DATE -1
GROUP BY cupom_fiscal_eletronico.serie, cupom_fiscal_eletronico.numero, cupomfiscal.totalliquido,
cupom_fiscal_eletronico.dh_emissao, itemcupomfiscal.idcupomfiscal, cupomfiscal.id,
cupom_fiscal_eletronico.url_qrcode, cupom_fiscal_eletronico.msg_retornada, cupom_fiscal_eletronico.situacao
