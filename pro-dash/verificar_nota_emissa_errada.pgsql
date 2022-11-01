SELECT numero FROM cupom_fiscal_eletronico
WHERE date(dh_emissao) <> date(dh_autorizacao)



limit 100