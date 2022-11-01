SELECT 
    ccf,
    dataabertura,
    serie_cupom, 
    numero_cupom, 
    codigo_status, 
    descricao_status,
    exportado 
    FROM retorno_sefaz
    INNER JOIN cupomfiscal ON
    cupomfiscal.ccf = retorno_sefaz.numero_cupom
WHERE date(dataabertura) = CURRENT_DATE
LIMIT 10

SELECT 
    dh_aber,
    serie,
    cupom_fiscal,
    msg_retornada,
    url_qrcode
 from cupom_fiscal_eletronico
 ORDER BY dh_autorizacao desc

limit 5


 select 
    datahoratransacao,
    descricaomodalidade,
    valordocumento,
    confirmado
  from dadostefdedicado

limit 5


 select * from pagamentotef

limit 5