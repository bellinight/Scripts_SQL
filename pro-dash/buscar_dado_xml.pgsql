SELECT xpath('//x:dhEmi/text()', xml_gerado::xml, 
ARRAY[ARRAY['x', 'http://www.portalfiscal.inf.br/nfe']])::varchar::date

FROM cupom_fiscal_eletronico


limit 10
