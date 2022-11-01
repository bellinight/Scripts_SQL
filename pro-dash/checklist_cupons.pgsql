SELECT count(itemcupomfiscal.quantidade) AS Itens_cupom, itemcupomfiscal.idcupomfiscal,
cupom_fiscal_eletronico.numero,
cupom_fiscal_eletronico.serie,
cupom_fiscal_eletronico.situacao,
cupom_fiscal_eletronico.dh_emissao,
xpath('//x:dhEmi/text()', cupom_fiscal_eletronico.xml_gerado::xml, 
ARRAY[ARRAY['x', 'http://www.portalfiscal.inf.br/nfe']])::varchar::timestamp AS Data_XML, 
cupomfiscal.totalliquido,
cupomfiscal.frete, 
sum(itemcupomfiscal.totaldesconto) AS Total_DESC,
sum(itemcupomfiscal.totalliquido) AS Total_IT_cup,
(cupomfiscal.totalliquido-cupomfiscal.frete) - sum(itemcupomfiscal.totalliquido) AS Diferenca_valor,
cupom_fiscal_eletronico.situacao_integracao,
cupom_fiscal_eletronico.msg_retornada,
cupom_fiscal_eletronico.dh_contingencia,
cupom_fiscal_eletronico.url_qrcode,
mex_evento.propagado,
(cupom_fiscal_eletronico.dh_emissao ::date <> xpath('//x:dhEmi/text()', cupom_fiscal_eletronico.xml_gerado::xml, 
ARRAY[ARRAY['x', 'http://www.portalfiscal.inf.br/nfe']])::varchar::date) 
FROM itemcupomfiscal
INNER JOIN cupomfiscal
ON itemcupomfiscal.idcupomfiscal = cupomfiscal.id
INNER JOIN cupom_fiscal_eletronico
ON itemcupomfiscal.idcupomfiscal = cupom_fiscal_eletronico.cupom_fiscal
INNER JOIN mex_evento
ON cupomfiscal.ID = mex_evento.id_objeto
WHERE date(cupom_fiscal_eletronico.dh_emissao) BETWEEN (CURRENT_DATE-31) and CURRENT_DATE +1
AND itemcupomfiscal.cancelado IS FALSE
GROUP BY cupom_fiscal_eletronico.numero, cupomfiscal.totalliquido,
cupom_fiscal_eletronico.dh_emissao, itemcupomfiscal.idcupomfiscal, 
cupomfiscal.id, cupom_fiscal_eletronico.situacao_integracao, 
cupom_fiscal_eletronico.msg_retornada, cupom_fiscal_eletronico.serie,
mex_evento.propagado, cupom_fiscal_eletronico.dh_contingencia,
cupom_fiscal_eletronico.situacao, cupom_fiscal_eletronico.xml_gerado,
cupom_fiscal_eletronico.url_qrcode
ORDER BY dh_emissao DESC


LIMIT 100