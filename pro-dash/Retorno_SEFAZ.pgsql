SELECT retorno_sefaz.codigo, numero_cupom, codigo_status, serie, dh_autorizacao, url_qrcode FROM retorno_sefaz
INNER JOIN cupom_fiscal_eletronico
ON retorno_sefaz.cupom_fiscal_eletronico = cupom_fiscal_eletronico.id
WHERE date(dh_emissao) = CURRENT_DATE -6
Limit 10

SELECT * from retorno_sefaz
ORDER BY id desc
limit 10


SELECT * from cupom_fiscal_eletronico
ORDER BY dh_emissao desc
limit 10