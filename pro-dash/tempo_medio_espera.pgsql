SELECT 
serie,
EXTRACT(EPOCH FROM (sum(dh_emissao - dh_autorizacao) ::time)/60/60) as diferenca_hora
FROM cupom_fiscal_eletronico

GROUP BY  cupom_fiscal_eletronico.serie




